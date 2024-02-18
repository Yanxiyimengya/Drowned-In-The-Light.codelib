extends Node;
class_name Character;

@export var cha_name: String = "";
@export var avator: Texture2D;
@export var cha_brief: String = "";
@export var hit_point_at_level_one: float;
@export var original_defence: float;
@export var original_attack: float;
@export var original_level: int;

var hit_point: float;
var defence: float;
var attack: float;
var weapon: Weapon;
var level: int;
var be_healed_ability: float;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
