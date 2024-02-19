extends Resource;
class_name Character;

enum STATE {
	LIVE,
	DEAD,
}

var name: String;
var characteristic: Characteristic;
var level;
var hp: int;
var attack: int;
var defence: int;
var curisity_hit_posibolity: int;
var curisity_hit_improvement: int;
var heal_improvement: int;
var speed: int;
var attack_improvement: int;
var skill_pool: Array = [];
var buff_pool: Array[Buff] = [];

func get_skill() -> Array:
	return skill_pool;

func get_buff() -> Array:
	return buff_pool;

func get_cur_char_after_buffed() -> Character:
	var character: Character = self; #应当实现对self的深拷贝。
	var buffs = self.get_buff();
	for buff in buffs:
		character = buff.method(character);
		pass;
	
	return character;

func upgrade():
	level += 1;
	match level:
		2: hp += 40;
		4: attack += 20;
		6: defence += 20;
		8: hp += 60;
		10:
			attack += 40;
			curisity_hit_posibolity += 5;
			heal_improvement += 5;
	pass;
