extends Control;
class_name TextTyper;
# 打字机组件

enum STATE {
	PAUSED,		# 停止
	WAIT,		# 等待
	PROCESS		# 运行
}; # 打字机状态

var text : String = "";
var char_node_list : Array[Control] = []; # 字符节点列表
var char_node_pool : Array[Control] = []; # 字符节点池

var typer_state : STATE = STATE.PROCESS;

func new_char(char : String) :
	var char_node : Label = Label.new(); # 构造字符节点
	char_node.text = char[0]; # 获取到字符
	self.add_child(char_node); # 添加入树
	char_node_list.push_back(char_node); # 压入字符列表
	pass; # 在末尾创建一个新的字符节点实例

func _process(delta) :
	pass;
