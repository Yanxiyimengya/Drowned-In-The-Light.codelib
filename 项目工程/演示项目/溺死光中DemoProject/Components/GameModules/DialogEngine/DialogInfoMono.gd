extends Resource;
class_name DialogInfoMono;

# 单个对话的信息

var text : String = ""; # 这条对话信息的文本
var data = {}; # 对话的附加信息
var option_items : Array[DialogOption] = [];
# 如果这条信息包含的选择分支,这是他的选项列表,如果为空他将不包含选择分支
var next : String = ""; # 在这条信息显示完成时,会跳跃到的对话索引,如果为 -1 则默认前进

func add_option(item_text : String, goto : String = "") ->  DialogInfoMono :
	var dialog_mono : DialogOption = DialogOption.new();
	option_items.push_back(dialog_mono);
	dialog_mono.text = item_text;
	dialog_mono.goto = goto;
	return self; # 为对话信息添加一条选项分支

func remove_option(slot :int) -> Error :
	if (slot < 0 && slot >= option_items.size()) :
		return Error.FAILED;
	option_items.remove_at(slot);
	return Error.OK; # 移除指定位置的选项分支

func has_options() -> bool :
	return !option_items.is_empty(); # 检测是否对话包含分支

func get_option_texts() -> Array[String] :
	var result : Array[String] = [];
	for item in option_items :
		result.push_back(item.text);
	return result; # 获取分支列表
