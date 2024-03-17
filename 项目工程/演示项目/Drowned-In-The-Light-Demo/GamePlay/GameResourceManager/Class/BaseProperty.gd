extends RefCounted;
class_name BaseProperty;
# 基础属性类
# 关于属性信息的全局类

var propertys_data : Dictionary = {};
# 属性信息数据
# 要想直接访问对应属性的数据,请先获取对应属性在GameResourceManager的配置信息

func _init() -> void:
	update(); # 初始化数据


#region 计算相关方法
func equal(property : BaseProperty) -> bool :
	for property_cfg in self.propertys_data :
		if (property.propertys_data.has(property_cfg)) :
			if (property.propertys_data[property_cfg] == self.propertys_data[property_cfg]) :
				continue;
		return false;
	return true;
	# 检测指定属性的对应属性值是否与此相等
	# 以防万一,如果被指定检测的属性没有此属性中的检测条目,则永远返回false

func add(property : BaseProperty) -> void :
	for property_cfg in self.propertys_data :
		if (property.propertys_data.has(property_cfg)) :
			self.propertys_data[property_cfg] += property.propertys_data[property_cfg];
	# 将指定的属性的所有与此条目属性相加

func sub(property : BaseProperty) -> void :
	for property_cfg in self.propertys_data :
		if (property.propertys_data.has(property_cfg)) :
			self.propertys_data[property_cfg] -= property.propertys_data[property_cfg];
	# 将指定的属性的所有与此条目属性相减

func mul(property : BaseProperty) -> void :
	for property_cfg in self.propertys_data :
		if (property.propertys_data.has(property_cfg)) :
			self.propertys_data[property_cfg] *= property.propertys_data[property_cfg];
	# 将指定的属性的所有与此条目属性相乘

func div(property : BaseProperty) -> void :
	for property_cfg in self.propertys_data :
		if (property.propertys_data.has(property_cfg)) :
			self.propertys_data[property_cfg] /= property.propertys_data[property_cfg];
	# 将指定的属性的所有与此条目属性相除

#endregion

func get_property(id : String) : 
	var property_cfg = GameResourceManager.get_base_property(id); # 获取到指定属性配置
	return propertys_data.get(property_cfg, null);
	# 以属性ID形式去获取属性条目数据
func set_property(id : String, value) :
	var property_cfg = GameResourceManager.get_base_property(id); # 获取到指定属性配置
	if (!propertys_data.has(property_cfg)) :
		return false;
	propertys_data[property_cfg] = value;
	return true;
	# 以属性ID形式去修改属性数据
func has_property(id : String) -> bool :
	var property_cfg = GameResourceManager.get_base_property(id); # 获取到指定属性配置
	if (property_cfg == null) :
		return false;
	return propertys_data.has(property_cfg);
	# 检查是否有此ID的属性数据

func update() :
	var propertys_list : Array[GameResourceManager.BasePropertyConfig] = \
			GameResourceManager.get_base_propertys();
	# 获取所有的属性配置信息列表
	for property_cfg in propertys_list : 
		if (propertys_data.has(property_cfg)) :
			continue;
		propertys_data[property_cfg] = property_cfg.default;
		# 以注册的属性信息填充默认属性值
	# 更新属性条目 添加新的条目并填充默认数据
