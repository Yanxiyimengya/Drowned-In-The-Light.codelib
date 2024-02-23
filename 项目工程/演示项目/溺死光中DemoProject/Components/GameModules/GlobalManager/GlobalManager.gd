extends Node;

# 游戏的全局管理器,响应全局事件

var configs = {}; # 游戏的配置设置
var assect_engine : Node = preload("./AssetsEngine.gd").new(); # 加载资源引擎
var audio_manager : Node = preload("./AudioManager/AudioManager.gd").new();

var game_play : Node = preload("../GamePlay/GamePlay.gd").new();

func _ready():
	self.add_child(audio_manager);
	self.add_child(game_play);
	pass;

func save_game() :
	pass;

func load_game() :
	pass;
