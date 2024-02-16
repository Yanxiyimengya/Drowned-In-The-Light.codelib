extends Node;
# 初始化场景

# 初始化配置文件

# 初始化DLC/Mod框架
# 初始化外部资源

func _init():
	# 初始化:LoadConfigs
	# 初始化:LoadResources
	pass;

var sys = DialogEngine.load_dialog_group_from_jsonfile("res://Components/GameModules/DialogEngine/DialogTest.json");
func _ready():
	pass;

func _input(e : InputEvent) :
	if (e is InputEventKey && e.is_pressed() && e.is_action("ui_accept")) :
		print(sys.get_this_message().text," ", sys.message_index);
		print("next",sys.get_next_message());
		var audio = GlobalManager.sound_manager.play_sound(load("res://Assets/Audios/Sounds/打开PC机.mp3"));
		
