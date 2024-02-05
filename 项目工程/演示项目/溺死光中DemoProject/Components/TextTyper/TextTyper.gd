extends Control;
class_name TextTyper;
# 打字机组件

enum STATE {
	PAUSED,
	PROCESS
}

var text : String = "";
var char_node_list : Array[Control] = []; # 字符节点列表
var char_node_pool : Array[Control] = []; # 字符节点池

var typer_state : STATE = STATE.PROCESS;
