extends Node;
class_name BattleCharacter;

# 玩家角色的战斗数据实例基类

var base_character_data : BaseCharacter = null;					# 角色属性数据
var battle_character_attributes: CharacterAttributes = null;	# 战斗时人物实时数据
var battle_manager : Node = null;								# 战斗管理器对象
var battle_effect_table : Dictionary = {};						# Buff实例Map
var battle_skill_pool: Dictionary = {};							# 战斗时的技能池

var current_hp : float = 0.0;
var attributes : CharacterAttributes = CharacterAttributes.new();

func _ready():
	pass;

func add_effect(effect_inst : BaseAdditionalEffect) : 
	if (battle_effect_table.has(effect_inst.effect_name)) :
		battle_effect_table[effect_inst.effect_name].wait_time += effect_inst.effect_time;
		pass;
	var effect_node : BaseBattleAdditionalEffect = BaseBattleAdditionalEffect.new(
		self, effect_inst
	);
	battle_manager.event.next_turn.register_object(effect_inst).bind(effect_node);
	battle_effect_table[effect_inst.effect_name] = effect_node;
	effect_node.timeout.connect(func() :
		battle_effect_table.erase(effect_node.effect_data.effect_name);
		effect_node.queue_free();
	);
	# 添加一个指定的效果给这个角色

# 通过指定方法复制特定数据。包括但不限于角色基础数据，角色技能，etc...
func char_init():
	battle_character_attributes = base_character_data.base_attributes.duplicate().add(base_character_data.bonus_attributes);
	for skill in base_character_data.skill_pool:
		battle_skill_pool[skill] = base_character_data.skill_pool[skill].duplicate();
		battle_manager.event.register_object(battle_skill_pool[skill]).bind(self);

func on_hit(_damage: float):
	pass;