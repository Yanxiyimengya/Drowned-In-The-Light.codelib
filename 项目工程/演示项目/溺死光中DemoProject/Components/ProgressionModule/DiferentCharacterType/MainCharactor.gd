extends Character;
class_name MainCharactor;

var memory_vestige_pool: Array[MemoryVestige];
var attack_improvement: int;
var keepsake_is_given: bool;
var keepsake_effecacy: DataImprovement;

func calculate_memory_vestige_effecacy():
	data_improvement.clear();
	for memory_vestige in memory_vestige_pool:
		data_improvement.add(memory_vestige.data_improvement);

func add_memory_vesitige(memory_vesitige: MemoryVestige):
	if (memory_vesitige.size() >= 6):
		return null; #这里应该返回错误的
	
	memory_vestige_pool.push_back(memory_vesitige);
	calculate_memory_vestige_effecacy();
	return memory_vestige_pool;

func delete_memory_vesitige(index: int):
	if (memory_vestige_pool.is_empty()):
		return null;
	
	for i in range(index + 1, memory_vestige_pool.size()):
		memory_vestige_pool[i - 1] = memory_vestige_pool[i];
		memory_vestige_pool[i] = null;
	
	return memory_vestige_pool;

func upgrade_level():
	level += 1;
	match level:
		2: base_data.hp += 40;
		4: base_data.attack += 20;
		6: base_data.defence += 20;
		8: base_data.hp += 60;
		10:
			base_data.attack += 40;
			base_data.curisity_hit_posibolity += 5;
			base_data.basheal_improvement += 5;
		12: base_data.defence += 40;
		14: base_data.hp += 100;
		16: base_data.attack += 40;
		18: base_data.defence += 40;
		20:
			base_data.curisity_hit_posibolity += 5;
			base_data.curisity_hit_improvement += 5;
			base_data.core_soul += 5;
