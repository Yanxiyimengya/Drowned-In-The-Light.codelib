extends Control;
class_name TextTyper;
# 打字机组件

enum STATE {
	PAUSED,		# 停止
	WAIT,		# 等待
	PROCESS,	# 运行
	INSTANT		# 瞬间显示
}; # 打字机状态

@export var text : String = "";
@export var typer_speed : int = 4;				# 打字机速度

var char_node_list : Array[Control] = [];		# 字符节点列表
var char_node_pool : Array[Control] = [];		# 字符节点池
var typer_process : int = 0;					# 打字机文本进度
var typer_state : STATE = STATE.PROCESS;
var typer_timer : int = 0;
var wait_timer : int = 0;
var typer_cursor_position : Vector2 = Vector2.ZERO;
var max_size : Vector2 = Vector2.ZERO;

var char_attribute = {
	color = Color.WHITE,
	scale = Vector2.ONE,
	font_assst = null,
	font_size = 18,
	voice = null
};

@onready var audio_player := $VoicePlayer;

func new_char(charactor : String) -> Label:
	var char_node : Label = null;
	if (char_node_pool.is_empty()) :
		char_node = Label.new();				# 构造字符节点
		self.add_child(char_node);				# 添加入树
		char_node_list.push_back(char_node);	# 压入字符列表
	else :
		char_node = char_node_pool.pop_back();	# 出栈
		char_node.visible = true;
	char_node.text = charactor[0];
	char_node.scale = char_attribute.scale;
	char_node.self_modulate = char_attribute.color;
	if (char_attribute.font_assst) :
		char_node.add_theme_font_override("font", char_attribute.font_assst);
	char_node.add_theme_font_size_override("font_size", char_attribute.font_size);
	
	if (char_attribute.voice) :
		audio_player.stream = char_attribute.voice;
		audio_player.play();
		pass;
	char_node.position = typer_cursor_position;
	typer_cursor_position.x += char_node.get_rect().size.x;
	if (max_size.x < typer_cursor_position.x) :
		max_size.x = typer_cursor_position.x;
	if (max_size.y < typer_cursor_position.y + char_node.get_rect().size.y) :
		max_size.y = typer_cursor_position.y + char_node.get_rect().size.y;
	return char_node; # 在末尾创建一个新的字符节点实例
func delete_char() -> void :
	if (char_node_list.size() > 0) :
		var end_node = char_node_list.pop_back();	# 获取末尾节点
		end_node.visible = false;
		char_node_pool.push_back(end_node);
		typer_process -= 1;
	pass; # 在末尾移除一个字符节点实例
func new_line() -> void :
	typer_cursor_position.x = 0;
	typer_cursor_position.y = max_size.y;
	if (max_size.y < typer_cursor_position.y) :
		max_size.y = typer_cursor_position.y;

func llex() -> Array[String] : 
	var this_char : String = text[typer_process]; # 获取当前打字的字符
	if( this_char != "{") : return [];
	var cmds : Array[String] = [];
	var cmd_text : String = "";
	while (true) :
		typer_process += 1;
		if (typer_process >= text.length()) :
			break;
		this_char = text[typer_process]; # 更新字符
		if (this_char == " ") :
			cmds.push_back(cmd_text);
			cmd_text = "";
			continue;
		elif (this_char == "}") :
			typer_process += 1;
			cmds.push_back(cmd_text);
			break;
		cmd_text += this_char;
	return cmds; # 对接下来的一段文本进行词法拆分

func update() :
	var current_char : String = text[typer_process];
	if (current_char == "{") :
		var cmd_array = llex();
		match cmd_array[0] :
			"instant" :
				typer_state = TextTyper.STATE.PROCESS if (typer_state == TextTyper.STATE.INSTANT) else TextTyper.STATE.INSTANT;
			
			"call" :
				var callable_value = self.get(cmd_array[1]);
				if (callable_value != null) :
					self.get(cmd_array[1]).callv(cmd_array.slice(2));
			_ :	pass;
		return;
	elif (current_char == "&" || current_char == "\r") :
		new_line();
		typer_process += 1;
	new_char(text[typer_process]);
	typer_process += 1;
	pass;

func _process(_delta : float) :
	if (typer_process >= text.length()) :
		return;
	while (true) :
		match (typer_state) :
			TextTyper.STATE.PAUSED :
				pass;
			TextTyper.STATE.WAIT :
				if (wait_timer > 0) :
					wait_timer -= 1;
					break;
				else :
					wait_timer = 0;
					typer_state = TextTyper.STATE.PROCESS;
			TextTyper.STATE.PROCESS :
				if (typer_timer <= 0) :
					typer_timer = typer_speed;
					self.update();
				else :
					typer_timer -= 1;
				break;
			TextTyper.STATE.INSTANT :
				if (typer_process >= text.length()) :
					break;
				update();
				pass;
