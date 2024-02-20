extends Resource;
class_name BaseCharacter;

# 一切角色数据的基类

var character_name : String = "undefined";			# 角色名称
var character_level : int = 0;						# 角色等级

var attributes : CharacterAttributes = CharacterAttributes.new();

func update_attributes() :
	pass;
