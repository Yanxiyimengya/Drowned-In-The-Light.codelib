extends RefCounted;
class_name EventCaller;

static func call_event(objs : Array[Object], method_name : String, args : Array = []) :
	for object in objs :
		if (!object.has_method(method_name)) :
			continue;
		object.get(method_name).callv(args);
	pass;
# 静态函数 调用多个对象的指定方法

var obj_list : Array[RegisterObject] = []; # 对象列表

func _init(objs : Array[RegisterObject] = []):
	for obj in objs :
		register_object(obj);

func trigger_event(method_name : String, args : Array = []) :
	var loop_count : int = 0;
	var obj : RegisterObject = null;
	for i in obj_list.size() : 
		obj = obj_list[loop_count];
		if (obj == null) :
			obj_list.remove_at(loop_count);
			continue;
		obj.trigger(method_name, args);
		loop_count += 1;
	# 触发事件

func register_object(obj : Object) -> RegisterObject : 
	var robj : RegisterObject = RegisterObject.new();
	robj.object = obj;
	obj_list.append(robj);
	return robj;
	# 注册一个对象

class RegisterObject :
	extends RefCounted;

	var object : Object = null;
	var bind_arguments : Array = [];

	func trigger(method_name : String, args : Array = []) :
		if (!object.has_method(method_name)) :
			return;
		args.append_array(bind_arguments);
		object.get(method_name).callv(args);
	
	func bind(arg) :
		bind_arguments.push_back(arg);
