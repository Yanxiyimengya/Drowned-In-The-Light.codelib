extends Node;
# 游戏资源管理器
# 他负责提供一切游戏可扩展项有关数据和信息
# ** 是最游戏重要的部分 **

var game_characters : Dictionary = {};
# 存储了注册的所有游戏角色信息
var battle_buffs : Dictionary = {};
# 存储了注册的所有战斗Buff信息
var character_skills : Dictionary = {};
# 存储了注册的所有人物技能信息
var accessories : Dictionary = {};
# 存储了注册的所有饰品信息

#region 细节扩展项

var base_propertys : Dictionary = {};
# 存储了注册的基础属性信息

#endregion

#region 扩展项内部信息类 ** 作用 : 封装注册信息配置
class CharacterConfig :
	extends RefCounted;
	var id : String = ""; 		# 角色注册的ID
	var name : String = ""; 	# 角色的当前展示名称 [根据不同语言切换]
	# 游戏角色信息配置

class BasePropertyConfig :
	extends RefCounted;
	var id : String = ""; 		# 一个属性注册的ID
	var name : String = "";		# 一个属性的当前显示名称
	var default = 0;			# 默认初始值
	# 基础属性配置信息配置
#endregion

func _init() : 
	
	register_base_property("attack", "Attack", 0);
	# 注册属性
	
	pass;

#region GameResourceManager的公开方法

#region BasePropertys相关

func register_base_property(id_name : String, name : String, default_value, registrants : String = "original") -> void :
	var id : String = registrants + "." + id_name;
	if (base_propertys.has(id)) :
		return; # 重复注册
	var property_cfg = self.BasePropertyConfig.new();
	property_cfg.id = id;
	property_cfg.name = name;
	property_cfg.default = default_value;
	base_propertys[id] = property_cfg;
	# 注册一个属性条目
	# 注册时 默认会为ID前添加注册方信息,实际上的ID为 <registrants.id_name>

func get_base_property(id : String) -> BasePropertyConfig :
	return base_propertys.get(id, null);
	# 以返回指定的属性信息

func get_base_ids() -> Array[String] :
	var result_array : Array[String] = [];
	for property in base_propertys :
		result_array.append(base_propertys[property].id);
	return result_array;
	# 以返回所有的属性字段名称

func get_base_propertys() -> Array[BasePropertyConfig] :
	var result_array : Array[BasePropertyConfig] = [];
	for property in base_propertys :
		result_array.append(base_propertys[property]);
	return result_array;
	# 以数组的形式返回所有的属性信息
#endregion



#endregion
