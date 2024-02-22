extends Resource;
class_name CharacterAttributes;

# 表示角色属性的类

var attributes : Dictionary = {
	hp = 0,							# 角色生命值
	attack = 0.0,					# 角色攻击力
	defense = 0.0,					# 角色防御力
	resistance = 0.0,				# 角色抗性
	speed = 0.0,					# 角色速度
	hit_probability = 0.0,			# 角色命中率
	therapy = 0.0,					# 角色治疗量
	critical_hit_probaility = 0.0,	# 角色暴击概率
	critical_hit_injury = 0.0,		# 角色暴击伤害倍率
	soul_core = 0,					# 核灵
};

static func load_form_file(file_path : String) -> CharacterAttributes :
	if (!FileAccess.file_exists(file_path)) :
		return null;
	var file = FileAccess.open(file_path, FileAccess.READ);
	var file_str : String = file.get_buffer(file.get_length()).get_string_from_utf8();
	file.close();
	var json : Dictionary = JSON.parse_string(file_str);
	if (json == null) :
		return null;
	var reault_attaribute : CharacterAttributes = CharacterAttributes.new();
	for attribute_mono in reault_attaribute.attributes :
		if (json.has(attribute_mono)) :
			reault_attaribute.attaributes[attribute_mono] = json.get(attribute_mono);
		pass;
	return reault_attaribute;

func add(add_attributes : CharacterAttributes) -> void :
	for attribute_mono in self.attributes :
		self.attributes[attribute_mono] += add_attributes.attributes.get(attribute_mono, \
				0.0);

func sub(sub_attributes : CharacterAttributes) -> void :
	for attribute_mono in self.attributes :
		self.attributes[attribute_mono] -= sub_attributes.attributes.get(attribute_mono, \
				0.0);
