extends Resource;
class_name BaseAccessory;

# 饰品实例基类
# 拥有对应的扩展Lua格式脚本

var display_name : String = "小视频";		# 饰品名
var display_tip : String = "";		# 养成面板饰品提示

func on_worn(_master : BaseCharacter) -> void :
	pass;
	# [回调]饰品被佩戴的时候触发 传入持有人对象的实例
func out_worn(_master : BaseCharacter) -> void :
	pass;
	# [回调]饰品取消佩戴的时候触发 传入持有人对象的实例
