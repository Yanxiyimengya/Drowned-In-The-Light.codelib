extends Object;
class_name DialogEngine;

# 对话配置解析引擎

static func load_dialog_group_from_jsonfile(json_file_path : String) -> DialogInfoGroup :
	if (!FileAccess.file_exists(json_file_path)) :
		return null;
	var file : FileAccess = FileAccess.open(json_file_path, FileAccess.READ);
	var file_string : String = file.get_buffer(file.get_length()).get_string_from_utf8();
	file.close();
	return load_dialog_group_from_json(file_string);

static func load_dialog_group_from_json(json_str : String) -> DialogInfoGroup :
	var json_struct = JSON.parse_string(json_str);	# 解析JSON文本 
	if (json_struct == null) :	return null; # 解析失败
	var dialpg_group : DialogInfoGroup = DialogInfoGroup.new();
	for dialog_key in json_struct :
		var dialog_info = json_struct[dialog_key];
		var message : DialogInfoMono = dialpg_group.add_message(dialog_key);
		message.text = str(dialog_info.text if (dialog_info.has("text") && \
				dialog_info.text != null) else message.text);
		message.next = str(dialog_info.next if (dialog_info.has("goto") && \
				dialog_info.goto != null) else message.next);
		if (dialog_info.has("options") && dialog_info["options"] is Dictionary) :
			var options = dialog_info["options"];
			for option in options :
				var option_text: String = str(options[option].text) if options[option].has("text") else "";
				var option_next : String = str(options[option].next) if options[option].has("next") else "";
				message.add_option(option_text, option_next);
		if (dialog_info.has("data") && dialog_info["data"] is Dictionary) :
			message.data = dialog_info["data"].duplicate();
	return dialpg_group;


