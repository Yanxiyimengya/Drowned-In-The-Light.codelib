extends Node;

@export var file_prelude_dest: String = "";
var module_table: Dictionary = {};

# 用于表示配置表格式的类，其中的属性应当都遵循这个格式
class UpgradeEntry:
	var level: int;
	var upgrade_cost: int;
	var attributes_growth: CharacterAttributes = CharacterAttributes.new();

# 从文件中导入配置模板
func load_module_table(file_dest: String = file_prelude_dest) -> Dictionary:
	if (!FileAccess.file_exists(file_dest)):
		return {};
	
	var file_content: String = FileAccess.get_file_as_string(file_dest);

	if (file_content == ""):
		return {};
	
	var json: Dictionary = JSON.parse_string(file_content);

	if (json == null):
		return {};
	
	var table: Dictionary = {};

	for key in json:
		if (json[key] == null):
			continue;
		
		var cur_dict = json[key];
		var upgrade_entry: UpgradeEntry = UpgradeEntry.new();

		upgrade_entry.level = cur_dict["level"];
		upgrade_entry.upgrade_cost = cur_dict["upgrade_cost"];

		var cur_attributes_growth_dict = cur_dict["attributes_growth"];
		var entry_attributes: CharacterAttributes = upgrade_entry.get("attributes_growth");

		for atom_attribute in cur_attributes_growth_dict:
			if (cur_attributes_growth_dict[atom_attribute] == null or entry_attributes.get(atom_attribute) == null):
				continue;
			
			entry_attributes.get(atom_attribute).set(cur_attributes_growth_dict[atom_attribute] as float);
		
		table[key] = upgrade_entry;
	
	return table;

func _ready():
	module_table = load_module_table();
	print_debug(module_table);
