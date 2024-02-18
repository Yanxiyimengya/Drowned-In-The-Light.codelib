extends Node;
class_name Character;

enum STATE {
	LIVE,
	DEATH,
}

enum JOB {
	ATTACKER,
	EXPLORER,
	HEALER,
	DEFENDER,
	SUPPORTER,
}

#都是角色等级为一且未受到模板加成时的数据
@export var cha_name: String = "";#角色名称
@export var avator: Texture2D;
@export var charactor_brief: String = "";
@export var job: JOB;
@export var original_hit_point: int;
@export var original_defence: int;
@export var original_attack: int;
@export var original_critical_probability: int;
@export var original_critical_hit_improvement: int;
@export var original_heal_improvement: int;
@export var original_speed: int;
@export var original_attack_improvement: int;
@export var char_save_location: String;

var level: int;
var hit_point: int;
var defence: int;
var attack: int;
var be_healed_ability: int;
var critical_probability: int;
var critcal_hit_improvemtent: int;
var heal_improvement: int;
var speed: int;
var attack_improvement: int;

var attacker = {
	hit_point= 360,
	attack = 210,
	defence = 110,
	critical_probability = 10,
	critical_hit_improvement = 20,
	heal_improvement = 0,
	speed = 70,
	attack_improvement = 0,
}

var explorer = {
	hit_point= 380,
	attack = 200,
	defence = 100,
	critical_probability = 5,
	critical_hit_improvement = 25,
	heal_improvement = 0,
	speed = 80,
	attack_improvement = 0,
}

var healer = {
	hit_point= 420,
	attack = 170,
	defence = 120,
	critical_probability = 0,
	critical_hit_improvement = 0,
	heal_improvement = 10,
	speed = 60,
	attack_improvement = 0,
}

var defender = {
	hit_point= 410,
	attack = 150,
	defence = 150,
	critical_probability = 0,
	critical_hit_improvement = 0,
	heal_improvement = 5,
	speed = 60,
	attack_improvement = 0,
}

var supporter = {
	hit_point= 390,
	attack = 190,
	defence = 100,
	critical_probability = 5,
	critical_hit_improvement = 10,
	heal_improvement = 0,
	speed = 90,
	attack_improvement = 0,
}

func save_character() -> bool:
	return true;

func initialize_data() -> Character:
	var character = Character.new();
	#当不存在角色配置文件，也就是角色未初始化时
	if !FileAccess.file_exists(char_save_location):
		match job:
			attacker:
				hit_point = original_hit_point + attacker.get(hit_point);
				attack = original_attack + attacker.get(attack);
				defence = original_defence + attacker.get(defence);
				critcal_hit_improvemtent = original_critical_hit_improvement + attacker.get(critcal_hit_improvemtent);
				heal_improvement = original_heal_improvement + attacker.get(heal_improvement);
				critical_probability = original_critical_probability + attacker.get(critical_probability);
				speed = original_speed + attacker.get(speed);
				attack_improvement = original_attack_improvement + attacker.get(attack_improvement);
			defender:
				hit_point = original_hit_point + defender.get(hit_point);
				attack = original_attack + defender.get(attack);
				defence = original_defence + defender.get(defence);
				critcal_hit_improvemtent = original_critical_hit_improvement + defender.get(critcal_hit_improvemtent);
				heal_improvement = original_heal_improvement + defender.get(heal_improvement);
				critical_probability = original_critical_probability + defender.get(critical_probability);
				speed = original_speed + defender.get(speed);
				attack_improvement = original_attack_improvement + defender.get(attack_improvement);
			explorer:
				hit_point = original_hit_point + explorer.get(hit_point);
				attack = original_attack + explorer.get(attack);
				defence = original_defence + explorer.get(defence);
				critcal_hit_improvemtent = original_critical_hit_improvement + explorer.get(critcal_hit_improvemtent);
				heal_improvement = original_heal_improvement + explorer.get(heal_improvement);
				critical_probability = original_critical_probability + explorer.get(critical_probability);
				speed = original_speed + explorer.get(speed);
				attack_improvement = original_attack_improvement + explorer.get(attack_improvement);
			healer:
				hit_point = original_hit_point + healer.get(hit_point);
				attack = original_attack + healer.get(attack);
				defence = original_defence + healer.get(defence);
				critcal_hit_improvemtent = original_critical_hit_improvement + healer.get(critcal_hit_improvemtent);
				heal_improvement = original_heal_improvement + healer.get(heal_improvement);
				critical_probability = original_critical_probability + healer.get(critical_probability);
				speed = original_speed + healer.get(speed);
				attack_improvement = original_attack_improvement + attacker.get(attack_improvement);
			supporter:
				hit_point = original_hit_point + supporter.get(hit_point);
				attack = original_attack + supporter.get(attack);
				defence = original_defence + supporter.get(defence);
				critcal_hit_improvemtent = original_critical_hit_improvement + supporter.get(critcal_hit_improvemtent);
				heal_improvement = original_heal_improvement + attacker.get(heal_improvement);
				critical_probability = original_critical_probability + attacker.get(critical_probability);
				speed = original_speed + attacker.get(speed);
				attack_improvement = original_attack_improvement + attacker.get(attack_improvement);
			_: pass;
		pass;
	
	#当存已经存在文件时读取的数据。等一下再来填
	return character;

func attack_other() -> void:
	pass;

func being_hit() -> void:
	pass;

func level_up() -> void:
	level += 1;
	match level:
		2: hit_point += 40;
		4: attack += 20;
		6: defence += 20;
		8: hit_point += 60;
		10:
			attack += 40;
			critical_probability += 5;
			heal_improvement += 5;
		12: defence += 40;
		14: hit_point += 100;
		16: hit_point += 40;
		18: defence += 40;
		20:
			critcal_hit_improvemtent += 5;
			speed += 5;
			attack_improvement += 5;
	pass;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
