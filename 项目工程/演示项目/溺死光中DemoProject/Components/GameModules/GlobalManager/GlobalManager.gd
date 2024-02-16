extends Node;

# 游戏的全局管理器,响应全局事件

var configs = {}; # 游戏的配置设置
var assect_engine : Object = preload("./AssetsEngine.gd").new();
var sound_manager : Object = preload("./SoundManager.gd").new();
# 加载资源引擎

# var initialize_engine : Object = preload("./InitializeEngine.gd").new();
# 加载初始化引擎

func _ready():
	self.add_child(sound_manager);
	pass;
