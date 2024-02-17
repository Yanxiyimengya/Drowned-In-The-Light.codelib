extends Node;

# 游戏的全局管理器,响应全局事件

var configs = {}; # 游戏的配置设置
var assect_engine : Object = preload("./AssetsEngine.gd").new();
var audio_manager : Object = preload("./AudioManager/AudioManager.gd").new();
# 加载资源引擎

func _ready():
	self.add_child(sound_manager);
	pass;

func save_game() :
	pass;

func load_game() :
	pass;
