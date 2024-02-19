extends Resource;
class_name Character;

enum STATE {
	LIVE,
	DEAD,
}

var name: String;
var characteristic: Characteristic;
var level;

class base_data:
	var hp: int;
	var attack: int;
	var defence: int;
	var curisity_hit_posibility: float;
	var curisity_hit_improvement: float;
	var heal_improvement: float;
	var speed: float;
	var core_soul: float;

class other_improvement:
	class pure_data_improvement:
		var hp_improvement: int;
		var attack_improvement: int;
		var defence_improvement: int;
	
	class percentage_improvement:
		var hp_improvement: float;
		var attack_improvement: float;
		var defence_improvement: float;
		var curisity_hit_posibility_improvement: float;
		var curisity_hit_improvement_improvement: float;
		var heal_improvemenet_improvement: float;
		var speed_improvement: float;

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

