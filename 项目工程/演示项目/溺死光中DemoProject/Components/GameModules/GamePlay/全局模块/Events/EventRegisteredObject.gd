extends RefCounted;
class_name EventRegisteredObject;

# 事件触发器实例

var callable : Callable = Callable();
var object : Object = null;		# 绑定的对象
var method_id : String = "";	# 方法ID
var args_list : Array = [];		# 绑定的属性列表

func _init(_object : Object = null, _method_id : String = "") :
	if (_object.has_method(_method_id)) :
		callable = Callable(_object, _method_id);
	object = _object;
	method_id = _method_id;
	pass; # 构造函数

func is_empty() -> bool :
	return callable.is_null() || (object == null) || (method_id.is_empty());
	# 检测这个注册方法是否为空

func bind_argument(arg) -> EventRegisteredObject:
	args_list.append(arg);
	return self;
	# 向这个事件触发器绑定一个参数

func unbind_argument(num : int) -> EventRegisteredObject :
	var arg_count : int = args_list.size();
	if (arg_count <= 0) :
		return;
	for i in num :
		args_list.pop_back();
	return self;
	# 向这个事件触发器绑定一个参数

func call_method(arguments : Array = []) -> void :
	var args : Array = args_list.duplicate();
	args.append_array(arguments);
	# 构造参数数组
	if (!callable.is_null()) :
		var aa = callable.callv(args);
	elif (object == null || method_id == null) :
		pass;
	return;
	# 调用注册方法(尽可能地避免每帧调用)
