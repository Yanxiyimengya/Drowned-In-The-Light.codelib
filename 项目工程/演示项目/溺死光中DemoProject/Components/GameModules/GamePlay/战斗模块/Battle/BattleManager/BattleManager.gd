extends Node;
# 负责管理战斗的战斗管理器

signal turn_end;

var turn_count : int = 0;	# 回合计数
var friendly_characters : Array[BattleCharacter] = [];
var enemy_characters : Array[BattleCharacter] = [];
# 战斗时角色实例

var event : Dictionary = {
	battle_start = EventCaller.new(),
	battle_end = EventCaller.new(),
	next_turn = EventCaller.new()
};

func battle_start() :
	event.next_turn.trigger_event("on_battle_start");
	# 战斗开始函数
func battle_end() : 
	event.next_turn.trigger_event("on_battle_end");
	# 战斗结束函数
func goto_next_turn() :
	turn_end.emit();
	event.next_turn.trigger_event(GamePlay.events_method_names.battle_next_turn);
	# 前往下一回合

func _process(_delta):
	if (Input.is_action_just_pressed("ui_up")) :
		goto_next_turn();
		pass
	pass;

func add_character(character_data : BaseCharacter, forces : int = 0) -> BattleCharacter :
	var character : BattleCharacter = BattleCharacter.new();
	character.battle_manager = self;
	character.character_data = character_data.duplicate(true);
	turn_end.connect(character._on_next_turn);
	if (forces == 0) :
		friendly_characters.append(character);
		$"CharactersLayer/FriendlyCharacters".add_child(character);
	elif (forces == 1) :
		enemy_characters.append(character);
		$"CharactersLayer/EnemyCharacters".add_child(character);
	return character;
