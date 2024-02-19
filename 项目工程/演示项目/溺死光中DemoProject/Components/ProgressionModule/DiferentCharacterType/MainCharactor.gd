extends Character;
class_name MainCharactor;

var memory_vestige_pool: Array[MemoryVestige];
var attack_improvement: int;

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
		12: defence += 40;
		14: hp += 100;
		16: attack += 40;
		18: defence += 40;
		20:
			curisity_hit_posibolity += 5;
			curisity_hit_improvement += 5;
			core_soul += 5;
