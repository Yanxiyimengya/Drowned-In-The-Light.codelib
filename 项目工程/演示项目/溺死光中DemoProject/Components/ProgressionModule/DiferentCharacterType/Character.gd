extends Resource;
class_name Character;

enum STATE {
	LIVE,
	DEAD,
}

var name: String;
var characteristic: Characteristic;
var level;
var base_data = BaseData.new();
var data_improvement = DataImprovement.new();

class BaseData:
	var hp: int;
	var attack: int;
	var defence: int;
	var curisity_hit_posibility: float;
	var curisity_hit_improvement: float;
	var heal_improvement: float;
	var speed: float;
	var core_soul: float;

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

