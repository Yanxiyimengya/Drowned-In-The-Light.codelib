extends Resource;
class_name BaseCharacter;

# 一切角色数据的基类

var character_name : String = "undefined";			# 角色名称
var character_level : int = 0;						# 角色等级
var character_images : Dictionary = {
	attack = null
};				# 角色图像

var base_attributes : CharacterAttributes = CharacterAttributes.new();
													# 角色基础属性
var bonus_attributes : CharacterAttributes = CharacterAttributes.new();
													# 角色数值加成属性

var upgrade_dict : Dictionary = {};		# 升级表 Dictionary[CharacterAttributes]
var skill_pool : Dictionary = {};		# 角色技能池 Dictionary[BaseCharacterSkill]

var accessories_list : Array[BaseAccessory] = [];		# 角色持有饰品列表
var skill_list : Array[BaseCharacterSkill] = [];		# 角色持有技能列表

func on_next_turn(battle_char : BattleCharacter) :
	print(battle_char.effect_table);
