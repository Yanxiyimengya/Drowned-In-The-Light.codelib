extends Resource;
class_name DialogInfoMono;

# 单个对话的信息

var text : String = ""; # 这条对话信息的文本
var data = {}; # 对话的附加信息
var option_items : Array[DialogInfoMono] = [];
# 如果这条信息包含的选择分支,这是他的选项列表,如果为空他将不包含选择分支
var next : String = ""; # 在这条信息显示完成时,会跳跃到的对话索引,如果为 -1 则默认前进

func add_option(item_text : String, next : String = "") ->  DialogInfoMono :
	var dialog_mono : DialogInfoMono = DialogInfoMono.new();
	option_items.push_back(dialog_mono);
	dialog_mono.text = item_text;
	dialog_mono.next = next;
	return self; # 为对话信息添加一条选项分支
func remove_option(slot :int) -> void :
	if (slot < 0 && slot >= option_items.size()) :
		return;
	option_items.remove_at(slot);
	pass; # 移除指定位置的选项分支
func has_options() -> bool :
	return !option_items.is_empty();
func get_option_texts() -> Array[String] :
	var result : Array[String] = [];
	for item in option_items :
		result.push_back(item.text);
	return result;
