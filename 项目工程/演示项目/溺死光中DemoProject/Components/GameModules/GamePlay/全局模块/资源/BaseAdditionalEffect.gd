extends Resource;
class_name BaseAdditionalEffect;

# 角色战斗时的附加效果(BUFF/DEBUFF)文件
# 拥有对应的扩展Lua格式脚本

var display_name : String = "";
var display_tip : String = "";
var type : String = "";		# Buff类型,同类Buff根据等级进行优先级排序
var level : int = 0			# Buff等级,高等和低等Buff同时存在,先计算高等Buff时间
var keep : int = 1;		# Buff/Debuff 持续时间(单位:回合)

func added(_master : BattleCharacter) -> void :
	pass; # [回调]效果被添加时触发

func removed(_master : BattleCharacter) -> void :
	pass; # [回调]效果被移除时触发
