extends Node;

@export var file_prelude_dest: String = "";
var module_table: Array;

class upgrade_table_entry:
	var attack: int;
	var attack_improvement: int;
