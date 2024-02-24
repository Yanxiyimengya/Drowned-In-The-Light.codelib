extends Node;
class_name BattleManager;
# 负责管理战斗的战斗管理器

signal battle_started;
signal battle_ended;
signal new_turn;

var battle_player_characters : Array[BattleCharacter] = [];
var battle_enemy_characters : Array[BattleCharacter] = [];
# 敌怪/角色战斗数据
var character_accessorts : Array[BaseAccessory] = []; # 饰品实例列表

var battle_event : BattleEvent = BattleEvent.new(); # 全局事件
var starting : bool = false; # 战斗是否已经开始
var turn_count : int = 0; # 回合计数

func start_battle(_player_chars : Array[BaseCharacter], _enemys : Array[BaseCharacter]):
	if (starting) :
		return;
	clear_battle();
	for char_data in _player_chars :
		var battle_char : BattleCharacter = BattleCharacter.new(char_data, battle_event);
		var reg_obj : EventRegisteredObject = battle_event.register_method(char_data, "on_battle_event")
		if (reg_obj) :	reg_obj.bind_argument(battle_char);
		if (reg_obj) :	reg_obj.bind_argument(self);
		battle_player_characters.append(battle_char);
		self.add_child(battle_char);
	for char_data in _enemys :
		var battle_char : BattleCharacter = BattleCharacter.new(char_data, battle_event);
		var reg_obj : EventRegisteredObject = battle_event.register_method(char_data, "on_battle_event")
		if (reg_obj) :	reg_obj.bind_argument(battle_char);
		if (reg_obj) :	reg_obj.bind_argument(self);
		battle_enemy_characters.append(battle_char);
		self.add_child(battle_char);
	# 创建战斗角色实例数据 并注册事件回调
	
	# 初始化敌怪与玩家战斗角色数据
	battle_event.trigger_event();
	battle_started.emit();
	self.starting = true;
	pass; # 构造函数 初始化战斗管理器
func clear_battle() :
	for char_data in battle_player_characters :
		char_data.free();
	for char_data in battle_enemy_characters :
		char_data.free();
	# 清理战斗数据
func end_battle() :
	battle_event.trigger_event();
	battle_ended.emit();
	clear_battle();
	self.starting = false;
	pass;
	# 结束战斗
func goto_next_turn() :
	battle_event.trigger_event();
	turn_count += 1;
	new_turn.emit();
	pass; # 这一回合结束 进入下一回合
func hurt_character() :
	pass;
	# 使一位角色受伤

func _process(_delta):
	if (Input.is_action_just_pressed("ui_down")) :
		goto_next_turn();
	pass;
