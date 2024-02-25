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
	if (effect_table.has(effect_inst.effect_name)) :
		effect_table[effect_inst.effect_name].wait_time += effect_inst.effect_time;
		pass;
	var effect_node : BaseBattleAdditionalEffect = BaseBattleAdditionalEffect.new(
		self, effect_inst
	);
	battle_manager.event.next_turn.register_object(effect_inst).bind(effect_node);
	effect_table[effect_inst.effect_name] = effect_node;
	effect_node.timeout.connect(func() :
		effect_table.erase(effect_node.effect_data.effect_name);
		effect_node.queue_free();
	);
	# 添加一个指定的效果给这个角色
