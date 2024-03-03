extends Node;
class_name BattleCharacter;

# 玩家角色的战斗数据实例基类

var character_data : BaseCharacter = null;	# 角色属性数据
var battle_manager : Node = null;			# 战斗管理器对象
var effect_table : Dictionary = {};			# Buff实例Map

var current_hp : float = 0.0;
var attributes : CharacterAttributes = CharacterAttributes.new();

func _ready():
	pass;

func add_effect(effect_inst : BaseAdditionalEffect) : 
	if (effect_table.has(effect_inst.type)) :
		effect_table[effect_inst.type].wait_time += effect_inst.effect_time;
		pass;
	var effect_node : BaseBattleAdditionalEffect = BaseBattleAdditionalEffect.new(
		self, effect_inst
	);
	battle_manager.turn_end.connect(effect_node._on_next_turn);
	effect_table[effect_inst.type] = effect_node;
	effect_node.removed.connect(func() :
		effect_table.erase(effect_node.effect_data.type);
		effect_node.queue_free();
	);
	# 添加一个指定的效果给这个角色

func _on_next_turn() : 
	if (character_data.has_method(GamePlay.events_method_names.battle_next_turn)) :
		character_data.call(GamePlay.events_method_names.battle_next_turn);
	pass;
