extends Resource;
class_name CharacterAttributes;

# 表示角色属性的类

var attributes : Dictionary = {
	hp = 0.0,							# 角色生命值
	attack = 0.0,					# 角色攻击力
	defense = 0.0,					# 角色防御力
	resistance = 0.0,				# 角色抗性
	speed = 0.0,					# 角色速度
	hit_probability = 0.0,			# 角色命中率
	therapy = 0.0,					# 角色治疗量
	critical_hit_probaility = 0.0,	# 角色暴击概率
	critical_hit_injury = 0.0,		# 角色暴击伤害倍率
	soul_core = 0.0,					# 核灵
};
var hp : float = 0 :
	set(value) :	attributes.hp = value;
	get :	return attributes.hp;
var attack : float = 0 :
	set(value) :	attributes.attack = value;
	get :	return attributes.attack;
var defense : float = 0 :
	set(value) :	attributes.defense = value;
	get :	return attributes.defense;
var resistance : float = 0 :
	set(value) :	attributes.resistance = value;
	get :	return attributes.resistance;
var speed : float = 0 :
	set(value) :	attributes.speed = value;
	get :	return attributes.hp;
var hit_probability : float = 0 :
	set(value) :	attributes.hit_probability = value;
	get :	return attributes.hit_probability;
var therapy : float = 0 :
	set(value) :	attributes.therapy = value;
	get :	return attributes.therapy;
var critical_hit_probaility : float = 0 :
	set(value) :	attributes.critical_hit_probaility = value;
	get :	return attributes.critical_hit_probaility;
var critical_hit_injury : float = 0 :
	set(value) :	attributes.critical_hit_injury = value;
	get :	return attributes.critical_hit_injury;
var soul_core : float = 0 :
	set(value) :	attributes.soul_core = value;
	get :	return attributes.soul_core;

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

func add(add_attributes : CharacterAttributes) -> CharacterAttributes :
	var new_attributes : CharacterAttributes = CharacterAttributes.new();
	for attribute_mono in self.attributes :
		new_attributes.attributes[attribute_mono] = self.attributes[attribute_mono] + \
				add_attributes.attributes.get(attribute_mono, \
				0.0);
	return new_attributes;

func sub(sub_attributes : CharacterAttributes) -> CharacterAttributes :
	var new_attributes : CharacterAttributes = CharacterAttributes.new();
	for attribute_mono in self.attributes :
		new_attributes.attributes[attribute_mono] = self.attributes[attribute_mono] - \
				sub_attributes.attributes.get(attribute_mono, \
				0.0);
	return new_attributes;

func mul(mul_attributes : CharacterAttributes) -> CharacterAttributes :
	var new_attributes : CharacterAttributes = CharacterAttributes.new();
	for attribute_mono in self.attributes :
		new_attributes.attributes[attribute_mono] = self.attributes[attribute_mono] * \
				mul_attributes.attributes.get(attribute_mono, 0.0);
	return new_attributes;

func div(div_attributes : CharacterAttributes) -> CharacterAttributes :
	var new_attributes : CharacterAttributes = CharacterAttributes.new();
	for attribute_mono in self.attributes :
		new_attributes.attributes[attribute_mono] = self.attributes[attribute_mono] / \
				div_attributes.attributes.get(attribute_mono, \
				0.0);
	return new_attributes;
