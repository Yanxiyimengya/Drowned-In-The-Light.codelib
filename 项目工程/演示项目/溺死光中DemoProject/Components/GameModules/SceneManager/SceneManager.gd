extends Control;

var mainScene = load(ProjectSettings.get_setting("application/run/main_scene"));
# 主场景

func change_scene_form_file(file_path : String) -> Error:
	if (!FileAccess.file_exists(file_path)) :
		return Error.FAILED;
	return Error.OK;
