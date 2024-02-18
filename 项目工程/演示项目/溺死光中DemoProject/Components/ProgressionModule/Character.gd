extends Resource;
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
@export var characteristic: Characteristic;
@export var job: JOB;
@export var original_HP: int;
@export var original_defence: int;
@export var original_attack: int;
@export var original_critical_probability: int;
@export var original_critical_hit_improvement: int;
@export var original_heal_improvement: int;
@export var original_speed: int;
@export var original_attack_improvement: int;

#实际的实时数据
var level: int = 1;
var HP_cur: int = 0;
var HP: int = 0;
var defence: int = 0;
var attack: int = 0;
var be_healed_ability: int = 0;
var critical_probability: int = 0;
var critcal_hit_improvement: int = 0;
var heal_improvement: int = 0;
var speed: int = 0;
var attack_improvement: int = 0;
var buff = [];
var skill = [];
var juelry = [];

func level_up() -> void:
	level += 1;
	match level:
		2: HP += 40;
		4: attack += 20;
		6: defence += 20;
		8: HP += 60;
		10:
			attack += 40;
			critical_probability += 5;
			heal_improvement += 5;
		12: defence += 40;
		14: HP += 100;
		16: HP += 40;
		18: defence += 40;
		20:
			critcal_hit_improvement += 5;
			speed += 5;
