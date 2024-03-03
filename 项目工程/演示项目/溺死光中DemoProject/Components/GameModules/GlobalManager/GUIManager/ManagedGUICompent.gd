extends Resource;
class_name ManagedGUIComponent;

@export var component_identifier: String = "";  #不允许为空且不允许有重复
@export var gui_component: PackedScene;