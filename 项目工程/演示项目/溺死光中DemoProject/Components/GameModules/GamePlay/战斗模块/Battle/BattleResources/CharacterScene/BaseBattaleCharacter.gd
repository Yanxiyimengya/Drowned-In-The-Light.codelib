extends Node;
class_name BattleCharacter;

# 玩家角色的战斗数据实例基类

var battle_event : BattleEvent = null :
	set(value) :
		if (value != null) :
			battle_event = value;
			for accessories in character_data.accessories_list :
				var reg_obj : EventRegisteredObject = battle_event.register_method(accessories, "on_battle_event");
				if (reg_obj) :	reg_obj.bind_argument(self);
				# 为饰品订阅事件
var character_data : BaseCharacter = null;				# 角色的数据
var buff_pool : Dictionary = {};	# 角色的Buff池
var skill_list : Array[BaseCharacterSkill] = [];		# 角色的技能列表

var maxhp : float = 0.0;							# 角色最大HP
var current_hp : float = 0.0;						# 角色当前HP
var current_attack : float = 0.0					# 角色当前攻击数值
var current_defense : float = 0.0					# 角色当前防御数值
var current_resistance : float = 0.0				# 角色当前抗性
var current_speed : float = 0.0						# 角色当前速度
var current_hit_probability : float = 0.0			# 角色当前抗性
var current_therapy : float = 0.0					# 角色当前治疗量
var current_critical_hit_probaility : float = 0.0	# 角色当前暴击概率
var current_critical_hit_injury : float = 0.0		# 角色当前暴击伤害倍率
var current_soul_core : float = 0.0					# 角色当前核灵

func _init(_character : BaseCharacter, _battle_event : BattleEvent) :
	character_data = _character.duplicate(true); # 克隆角色
	character_data.accessories_list = _character.accessories_list.duplicate(true);
	character_data.skill_list = _character.skill_list.duplicate(true);
	
	update_attributes();
	current_hp = maxhp;
	
	var count : int = 0;
	for skill in character_data.skill_list :
		if (character_data.skill_pool.has(skill)) :
			skill_list[count] = skill;
			count += 1;
		# 验证技能是否存在于技能池,并将其push进技能列表
	
	battle_event = _battle_event; # 战斗事件实例
	pass; # 构造函数,初始化一个 BattleCharacter

func update_attributes() -> void :
	maxhp = character_data.base_attributes.attributes.hp * character_data.bonus_attributes.attributes.hp;
	var attributes : CharacterAttributes = character_data.base_attributes.mul(character_data.bonus_attributes);
	current_attack = attributes.attack;
	current_defense = attributes.defense;
	current_resistance = attributes.resistance;
	current_speed = attributes.speed;
	current_hit_probability = attributes.hit_probability;
	current_therapy = attributes.therapy;
	current_critical_hit_probaility = attributes.critical_hit_probaility;
	current_critical_hit_injury = attributes.critical_hit_injury;
	current_soul_core = attributes.soul_core;
	# 更新计算数值

func add_additional_effect(effect_inst : BaseAdditionalEffect) :
	if (buff_pool.has(effect_inst)) :
		buff_pool[effect_inst].buff_time += effect_inst.buff_time;
		return;
	var buff_ins = BaseBattleAdditionalEffect.new(self, effect_inst);
	self.add_child(buff_ins);
	buff_pool[effect_inst] = buff_ins;
	if (battle_event != null) :
		var reg_obj : EventRegisteredObject = battle_event.register_method(effect_inst, "on_battle_event");
		if (reg_obj) :	reg_obj.bind_argument(self);
		# 订阅事件

