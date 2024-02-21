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
var generate_list: Dictionary;													#来源于指定配置文件，里
																				#面有各个表的材料。层级
																				#结构为：总表 -> 忆痕类
																				#型表 -> 忆痕词条 {词条
																				#所属类别，词条名称，范
																				#围下限，范围上限，权重}
var generate_list_path: String = "";

func new_memory_vestige(kind: KIND, rarity) -> MemoryVestige:
	match kind:
		0: return new_collect_memory_vestige(rarity);
		1: return define_attributes("collect", rarity);
		2: return define_attributes("growth", rarity);
		3: return define_attributes("infliration", rarity);
		4: return define_attributes("distribution", rarity);
		5: return define_attributes("conbination", rarity);
		_: return;
	

func new_collect_memory_vestige(rarity: RARITY) -> MemoryVestige:
	var memory_vestige = MemoryVestige.new();
	var pure_data_improvement = data_improvement.pure_data_improvement;
	pure_data_improvement.hp_improvement += randf_range(400.0, 600.0) as int;
	pure_data_improvement.attack_improvement += randf_range(200.0, 300.0) as int;
	memory_vestige.percentage_improvement.speed_improvement += randf_range(5.0, 10.0) as int;
	return memory_vestige;

func define_attributes(name: String, rarity: RARITY) -> MemoryVestige:
	var memory_vestige: MemoryVestige = MemoryVestige.new();
	var entry_list: Dictionary = generate_list.get(name);						# 存放了具体忆痕种类的升级词条的字典
	var selected_entry_list: Array[Dictionary];
	
	for i in range(0, rarity + 3):
		var weight_sum = sum_weight(entry_list);
		var rand_num = randf_range(0, weight_sum);
		var ptr = 0;
		
		for entry in entry_list:
			if (ptr >= rand_num): break;
			var entry_at = entry_list.get(entry)
			selected_entry_list[i] = entry_at;
			ptr += entry_at.get("weight");
			entry_at.get("weight").erase();
			pass;
		pass;
	
	for entry in selected_entry_list:
		self.get(entry.get("percent_or_data")).get(entry.get("name")).set(randf_range(entry.get("min
		\n_limit"), entry.get("max_limit")));									#设置对应键对应的值
	
	return memory_vestige;

func sum_weight(list: Dictionary) -> int:
	var sum: int = 0;
	for member in list:															# member：每个表中的具体词条中的内容
		if (!member.has("weight")): continue;
		sum += member.get("weight");
	return sum;
