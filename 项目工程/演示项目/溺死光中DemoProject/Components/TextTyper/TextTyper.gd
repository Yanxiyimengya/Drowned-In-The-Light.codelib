extends Control;
class_name TextTyper;
# 打字机组件

enum STATE {
	PAUSED,		# 停止
	WAIT,		# 等待
	PROCESS		# 运行
}; # 打字机状态

@export var text : String = "";
var typer_process : int = 0;					# 打字机文本进度
var typer_speed : int = 4;						# 打字机速度

var char_node_list : Array[Control] = [];		# 字符节点列表
var char_node_pool : Array[Control] = [];		# 字符节点池

var typer_state : STATE = STATE.PROCESS;

func new_char(char : String) -> Label:
	var char_node : Label = null;
	if (char_node_pool.is_empty()) :
		char_node = Label.new();				# 构造字符节点
		self.add_child(char_node);				# 添加入树
		char_node_list.push_back(char_node);	# 压入字符列表
		char_node_pool.push_back(char_node);	# 压入字符节点池
	else :
		char_node = char_node_pool.pop_back();	# 出栈
		char_node.visible = true;
	char_node.text = char[0];
	return char_node; # 在末尾创建一个新的字符节点实例
func delete_char() -> void :
	var end_node = char_node_list.pop_back();	# 获取末尾节点
	end_node.visible = false;
	char_node_pool.push_back(end_node)
	pass; # 在末尾移除一个字符节点实例
func llex() -> Array[String] : 
	var this_char : String = text[typer_process]; # 获取当前打字的字符
	if( this_char != "{") : return [];
	var cmds : Array[String] = [];
	var cmd_text : String = "";
	while (true) :
		typer_process += 1;
		this_char = text[typer_process]; # 更新字符
		if (this_char == "}" || (typer_process >= text.length())) :
			cmds.push_back(cmd_text);
			break;
		elif (this_char == " ") :
			cmds.push_back(cmd_text);
			cmd_text = "";
			continue;
		cmd_text += this_char;
	return cmds; # 对接下来的一段文本进行词法拆分


func _process(delta : float) :
	print(llex());
	if (typer_state == STATE.PAUSED) :
		return;
	pass;
