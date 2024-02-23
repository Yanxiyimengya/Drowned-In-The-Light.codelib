extends Resource;
class_name BaseCharacterSkill;

# 角色的技能基类
# 拥有对应的扩展Lua格式脚本

var skill_name : String = "";
var tags : Array[String] = [];

func add_tag(tag_name : String) -> void :
	if (tags.has(tag_name)) :
		return;
	tags.append(tag_name);
	# 添加一个标签

func has_tag(tag_name : String) -> void :
	return tags.has(tag_name);
	# 检查是否拥有指定标签

func unleash_skill(_master : BaseBattleCharacter, _target : Array[BaseBattleCharacter]) -> void :
	pass;
	# [回调]当这个技能在战斗中被使用
	# _master : 使用者
	# _target : 目标角色数组

