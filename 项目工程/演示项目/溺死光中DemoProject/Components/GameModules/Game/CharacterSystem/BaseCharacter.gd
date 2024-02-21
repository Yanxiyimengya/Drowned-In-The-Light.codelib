extends Resource;
class_name BaseCharacter;

# 一切角色数据的基类

var character_name : String = "undefined";			# 角色名称
var character_level : int = 0;						# 角色等级

var base_attributes : CharacterAttributes = CharacterAttributes.new();
													# 角色基础属性
var attributes : CharacterAttributes = CharacterAttributes.new();
													# 角色当前属性
var upgrade_dict : Dictionary = {};					# 升级表
var accessories : Array[BaseAccessory] = [];		# 佩戴的饰品实例列表

class UpgradeDict :
	var upgrade_dict : Array[CharacterAttributes] = [];
	pass;
