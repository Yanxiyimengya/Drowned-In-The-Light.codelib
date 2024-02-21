extends Resource;
class_name MemoryVestige;

enum KIND {
	COLLECT,
	GROWTH,
	INFLIRATION,
	DISTRIBUTION,
	CONBINATION,
};

enum RARITY {
	PRIMARY,
	MIDLE,
	TOP,
};

var name: String;
var kind: KIND;
var data_improvement = DataImprovement.new();
var generate_list: Dictionary;					#指向指定配置文件，里面有各个表的材料。

func new_memory_vestige(kind: KIND, rarity) -> MemoryVestige:
	match kind:
		0: return new_collect_memory_vestige(rarity);
		1: return new_growth_memory_vestige(rarity);
		_: return;

func new_collect_memory_vestige(rarity: RARITY) -> MemoryVestige:
	var memory_vestige = MemoryVestige.new();
	var pure_data_improvement = data_improvement.pure_data_improvement;
	pure_data_improvement.hp_improvement += randf_range(400.0, 600.0) as int;
	pure_data_improvement.attack_improvement += randf_range(200.0, 300.0) as int;
	memory_vestige.percentage_improvement.speed_improvement += randf_range(5.0, 10.0) as int;
	return memory_vestige;

func new_growth_memory_vestige(rarity: RARITY) -> MemoryVestige:
	var memory_vestige = MemoryVestige.new();
	var growth_list = generate_list.get("growth");
	return memory_vestige;

func new_infliration_memory_vestige(rarity: RARITY) -> MemoryVestige:
	var memory_vestige = MemoryVestige.new();
	var growth_list = generate_list.get("infliration");
	return memory_vestige;

func new_distribution_memory_vestige(rarity: RARITY) -> MemoryVestige:
	var memory_vestige = MemoryVestige.new();
	var growth_list = generate_list.get("distribution");
	return memory_vestige;

func new_conbination_memory_vestige(rarity: RARITY) -> MemoryVestige:
	var memory_vestige = MemoryVestige.new();
	var growth_list = generate_list.get("conbination");
	return memory_vestige;
