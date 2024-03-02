extends Node;

signal run_sign;

@export var file_prelude_dest: String = "";
var module_table: Dictionary = {};
var case_module_table: Dictionary;

func load_configuration_from_file(dest: String = file_prelude_dest) -> Dictionary:
	file_prelude_dest = dest;

	if (!FileAccess.file_exists(dest)):
		return {};
	
	var configuration_file := FileAccess.open(dest, FileAccess.READ);

	if configuration_file == null:
		return {};
	
	var conf_string: String = configuration_file.get_as_text();

	if conf_string == null:
		return {};
	
	var case_table: Dictionary = JSON.parse_string(conf_string);

	return case_table;

# 对外暴露的方法
func generate_assessory(master: BaseCharacter, kind: String, rarity: int) -> MemoryVestige:
	var memory_vestige: MemoryVestige = null;
	for key in module_table:
		if key == kind:
			memory_vestige = generate_designated_assessory(module_table[key], rarity);
	
	if (memory_vestige == null):
		return ;
	
	memory_vestige.master = master;
	return memory_vestige;

func calculate_weight(table: Array) -> int:
	var sum := 0;

	for entry in table:
		sum += entry["weight"];
	
	return sum;

func write_entry_to_assessory(assessory: MemoryVestige, entry_table: Array) -> MemoryVestige:
	print(entry_table);

	if entry_table == []:
		return;
	
	for entry in entry_table:
		var entry_name: String = entry["name"];

		if (entry["kind"] == "base_attribute" or entry["kind"] == null):
			var rand_num = randf_range(entry["lower_limit"], entry["upper_limit"]);
			assessory.base_add_attributes.set(entry_name, rand_num);
		else:
			var rand_num = randf_range(entry["lower_limit"], entry["upper_limit"]);
			assessory.bonus_add_attributes.set(entry_name, rand_num);
		
	return assessory;

func generate_designated_assessory(module_sub_tabel: Array, rarity: int) -> MemoryVestige:
	if (module_sub_tabel == []):
		return;
	
	var memory_vestige: MemoryVestige = MemoryVestige.new();
	var selected_entry_saver: Array[Dictionary] = [];

	for _i in range(0, rarity + 3):
		var total_weight: int = calculate_weight(module_sub_tabel);
		var random_num: float = randf_range(0, total_weight);
		var counter = 0;
		var selected_entry: Dictionary = {};

		for entry in module_sub_tabel:
			if (entry["weight"] == null or entry["name"] == null or entry["upper_limit"] == null or entry["lower_limit"] == null or entry["name"] == null):
				continue;
			
			if (counter + entry["weight"] < random_num):
				counter += entry["weight"];
				continue;
			
			entry["weight"] = 0;
			selected_entry = entry;
			break;
		
		selected_entry_saver.append(selected_entry);

	write_entry_to_assessory(memory_vestige, selected_entry_saver);
	module_table = load_configuration_from_file();
	return memory_vestige;

func _ready():
	case_module_table = load_configuration_from_file();
	module_table = case_module_table.duplicate(true);
	var assessory: BaseAccessory = generate_assessory(BaseCharacter.new(), "死灭回游", 0);
	print(assessory.base_add_attributes.get("attack"));
	print(assessory.base_add_attributes.get("defense"));
	print(assessory.base_add_attributes.get("speed"));
	print(assessory.base_add_attributes.get("soul_core"));
