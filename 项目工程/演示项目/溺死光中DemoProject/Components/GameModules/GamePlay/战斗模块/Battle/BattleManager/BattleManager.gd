extends Node;

# 负责管理战斗的战斗管理器
signal next_turn; # 回合结束

var turn_count : int = 0;	# 回合计数

var friendly_characters : Array[BattleCharacter] = [];
var enemy_characters : Array[BattleCharacter] = [];
# 战斗时角色实例

var event : Dictionary = {
	next_turn = EventCaller.new()
};

func _on_battle_start() :
	pass;
	# 战斗开始函数

func _on_battle_end() : 
	pass;
	# 战斗结束函数

func _on_next_turn() :
	event.next_turn.trigger_event("on_next_turn");
	pass;
	# 前往下一回合

func _process(_delta):
	if (Input.is_action_just_pressed("ui_up")) :
		next_turn.emit();
	pass;

func add_character(character_data : BaseCharacter, forces : int = 0) :
	var character : BattleCharacter = BattleCharacter.new();
	character.battle_manager = self;
	character.character_data = character_data.duplicate(true);
	event.next_turn.register_object(character.character_data).bind(character);
	if (forces == 0) :
		friendly_characters.append(character);
		$"CharactersLayer/FriendlyCharacters".add_child(character);
	elif (forces == 1) :
		enemy_characters.append(character);
		$"CharactersLayer/EnemyCharacters".add_child(character);
