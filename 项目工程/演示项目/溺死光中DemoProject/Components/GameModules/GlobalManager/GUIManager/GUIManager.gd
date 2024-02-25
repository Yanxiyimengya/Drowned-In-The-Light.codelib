# GUI管理控件
extends Node;
class_name GUIManager;

signal OutputEvent; # 用于对外输出的事件信号，用于处理需要其他模块处理的事件

@export var managed_gui_components: Array[ManagedGUIComponent] = []; # 被管理的GUI组件
@export var gui_displayer: Node; #组件本体内容

var instantiated_gui_map: Dictionary= {};

# 初始化组件，将其加载完毕并储存至查询表之中
func _build_up():
    for boxed_component in managed_gui_components:
        if boxed_component == null or boxed_component.gui_component == null:
            continue;
        
        var uninstantiate_component: PackedScene = boxed_component.gui_component;
        var instantiate_component: BaseGUIComponent = uninstantiate_component.instantiate();
        gui_displayer.add_child(instantiate_component);
        instantiate_component.hide();
        instantiated_gui_map[boxed_component.component_identifier] = instantiate_component;

func get_instantiate_component(ident: String) -> CanvasItem:
    return instantiated_gui_map[ident];

# 唤醒一个GUI组件，使他开始工作
func wake_component(ident: String, signa = null):
    emit_message(signa);
    var component: BaseGUIComponent = instantiated_gui_map[ident];
    component.show();
    component.wake();

# 使一个GUI组件沉睡，也就是在屏幕上消失
func make_component_sleep(ident: String, signa = null):
    emit_message(signa);
    var component: BaseGUIComponent = instantiated_gui_map[ident];
    component.sleep();
    component.hide();

# 用于向外发送信号
func emit_message(message):
    OutputEvent.emit(message);