extends RefCounted;

class_name BaseBattleCharacter;

# 玩家角色的战斗数据实例基类

var character_data : BaseCharacter = null;				# 角色的数据
var buff_pool : Array[BaseCharacterAdditionalEffect] = [];	# 角色的Buff池
var skill_list : Array[BaseCharacterSkill] = [];		# 角色的技能列表

func _init(character : BaseCharacter) :
	character_data = character;
	var count : int = 0;
	for skill in character_data.skill_list :
		if (character_data.skill_pool.has(skill)) :
			skill_list[count] = skill;
			count += 1;
		# 验证技能是否存在于技能池,并将其push进技能列表
	pass; # 构造函数,初始化一个 BattleCharacter

