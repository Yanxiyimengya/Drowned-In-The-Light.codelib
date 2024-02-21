extends RefCounted;

class_name BaseEvent;

# 事件对象

signal trigger_evented;

var type : String = "";				# 事件类型
var register_list : Array[EventRegisteredObject] = [];		# 注册事件的对象列表

func register_method(object : Object, method_id : String) -> EventRegisteredObject :
	var reg_object : EventRegisteredObject = EventRegisteredObject.new(object, method_id);
	if (reg_object.is_empty()) :
		return null;
	register_list.append(reg_object);
	return reg_object;
	# 注册一个方法

func unregister_method(_object : Object, _method_id : String) -> void :
	var count : int = 0;
	for reg_object in register_list :
		if (reg_object.object == _object && reg_object.method_id == _method_id) :
			register_list.remove_at(count);
		count += 1;
	# 取消注册一个方法

func trigger_event(arguments : Array = []) -> void :
	trigger_evented.emit();
	for reg_object in register_list :
		reg_object.call_method(arguments);
	pass; # 触发这个事件
