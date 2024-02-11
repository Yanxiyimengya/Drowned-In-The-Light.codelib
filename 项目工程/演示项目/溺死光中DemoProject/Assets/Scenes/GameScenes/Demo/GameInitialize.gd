extends Node;
# 初始化场景


# 初始化配置文件

# 初始化DLC/Mod框架
# 初始化外部资源

func _init():
	# 初始化:LoadConfigs
	# 初始化:LoadResources
	pass; 

var dgg:DialogInfoGroup;
func _ready():
	
	var json = "res://Components/GameModules/DialogEngine/DialogTest.json";
	var txt = FileAccess.open(json,FileAccess.READ).get_as_text();
	#print(txt)
	dgg = DialogEngine.load_dialog_group_from_json(txt);
	
	pass; 
func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")) :
		print(dgg.get_this_message().text);
		if (dgg.get_this_message().has_options()) :
			print(dgg.get_this_message().get_option_texts());
		var next = dgg.get_next_message();
		if (next == null) :
			print("至此,已成艺术(完事)");
		
