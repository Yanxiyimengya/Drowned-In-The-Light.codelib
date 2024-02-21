extends RefCounted;
class_name BaslCharacterSkill;

# 角色的技能基类
# 拥有对应的扩展Lua格式脚本

var skill_name : String = "";
var name : String = "" :
	set(value) :
		skill_name = name;
	get :
		return skill_name;
	# skill_name 对外属性
var tags : Array[String] = [];

func add_tag(tag_name : String) -> void :
	if (tags.has(tag_name)) :
		return;
	tags.append(tag_name);
	# 添加一个标签

func has_tag(tag_name : String) -> void :
	return tags.has(tag_name);
	# 检查是否拥有指定标签
