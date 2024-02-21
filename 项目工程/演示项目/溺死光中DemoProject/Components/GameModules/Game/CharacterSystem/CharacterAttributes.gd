extends Resource;
class_name CharacterAttributes;

# 表示角色属性的类

var hp : int = 0;							# 角色生命值
var attack : float = 0.0;					# 角色攻击力
var defense : float = 0.0;					# 角色防御力
var resistance : float = 0.0				# 角色抗性
var hit_decount: float = 0.0				# 伤害减免
var speed : float = 0.0;					# 角色速度
var hit_probability : float = 0.0;			# 角色命中率
var therapy : float = 0.0;					# 角色治疗量
var therapy_fixed : float = 0.0;			# 角色治疗修正
var critical_hit : float = 0.0;				# 角色暴击概率
var critical_hit_fixed : float = 0.0;		# 角色暴击修正
var critical_hit_injury : float = 0.0;		# 角色暴击伤害倍率
var soul_core : float = 0;					# 核灵

static func load_form_file(file_path : String) -> CharacterAttributes :
	if (!FileAccess.file_exists(file_path)) :
		return null;
	var file = FileAccess.open(file_path, FileAccess.READ);
	var file_str : String = file.get_buffer(file.get_length()).get_string_from_utf8();
	file.close();
	var json : Dictionary = JSON.parse_string(file_str);
	if (json == null) :
		return null;
	var attaributes : CharacterAttributes = CharacterAttributes.new();
	attaributes.hp = 					json.get("hp", attaributes.hp);
	attaributes.attack = 				json.get("attack", attaributes.attack);
	attaributes.defense = 				json.get("defense", attaributes.defense);
	attaributes.resistance = 			json.get("resistance", attaributes.resistance);
	attaributes.hit_decount = 			json.get("hit_decount", attaributes.hit_decount);
	attaributes.speed = 				json.get("speed", attaributes.speed);
	attaributes.hit_probability = 		json.get("hit_probability", attaributes.hit_probability);
	attaributes.therapy = 				json.get("therapy", attaributes.therapy);
	attaributes.therapy_fixed = 		json.get("therapy_fixed", attaributes.therapy_fixed);
	attaributes.critical_hit = 			json.get("critical_hit", attaributes.critical_hit);
	attaributes.critical_hit_fixed =	json.get("critical_hit_fixed", attaributes.critical_hit_fixed);
	attaributes.critical_hit_injury =	json.get("critical_hit_injury", attaributes.critical_hit_injury);
	attaributes.soul_core =				json.get("soul_core", attaributes.soul_core);
	return attaributes;

func add(attributes : CharacterAttributes) -> void :
	self.hp += attributes.hp;
	self.attack += attributes.attack;
	self.defense += attributes.defense;
	self.resistance += attributes.resistance;
	self.hit_decount += attributes.hit_decount;
	self.speed += attributes.speed;
	self.hit_probability += attributes.hit_probability;
	self.therapy += attributes.therapy;
	self.therapy_fixed += attributes.therapy_fixed;
	self.critical_hit += attributes.critical_hit;
	self.critical_hit_fixed += attributes.critical_hit_fixed;
	self.critical_hit_injury += attributes.critical_hit_injury;
	self.soul_core += attributes.soul_core;

func sub(attributes : CharacterAttributes) -> void :
	self.hp -= attributes.hp;
	self.attack -= attributes.attack;
	self.defense -= attributes.defense;
	self.resistance -= attributes.resistance;
	self.hit_decount -= attributes.hit_decount;
	self.speed -= attributes.speed;
	self.hit_probability -= attributes.hit_probability;
	self.therapy -= attributes.therapy;
	self.therapy_fixed -= attributes.therapy_fixed;
	self.critical_hit -= attributes.critical_hit;
	self.critical_hit_fixed -= attributes.critical_hit_fixed;
	self.critical_hit_injury -= attributes.critical_hit_injury;
	self.soul_core -= attributes.soul_core;


