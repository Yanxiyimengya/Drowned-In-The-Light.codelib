extends Resource;
class_name DialogInfoGroup;

# 存放一组对话的结构 = null;

var message_index : int = 0;	# 当前信息的索引
var dialog_messages : Array[DialogInfoMono] = []; # 信息队列
var message_map = {};		# 存储消息Key索引的HashMap

func add_message(key : String,text : String = "") -> DialogInfoMono :
	if (message_map.has(key)) :
		return;
	var dialog_info : DialogInfoMono = DialogInfoMono.new();
	dialog_info.text = text;
	message_map[key] = dialog_messages.size();
	dialog_messages.push_back(dialog_info);
	return dialog_info; # 向消息队列添加一条消息
func remove_message(key : String) -> void :
	if (!message_map.has(key)) :
		return;
	var index : int = message_map[key];
	message_map.erase(key);
	dialog_messages.remove_at(index);
	# 在队列中移除信息

func jump_to(key : String) -> void : 
	if (!message_map.has(key)) :
		return;
	message_index = message_map[key];

func get_this_message() -> DialogInfoMono :
	var this_message : DialogInfoMono = dialog_messages[message_index];
	return this_message;

func get_next_message() -> DialogInfoMono : 
	var this_message : DialogInfoMono = dialog_messages[message_index];
	var next_message : DialogInfoMono;
	if (this_message.next.is_empty()) : # if(this_message.next==""):
		if (message_index + 1 >= dialog_messages.size()) :
			return null;
		message_index += 1;
		next_message = dialog_messages[message_index];
	else :
		if (!message_map.has(this_message.next)) :
			return null;
		message_index = message_map[this_message.next];
		next_message = dialog_messages[message_index];
	return next_message;	# 获取下一条信息,指针自动跳转
