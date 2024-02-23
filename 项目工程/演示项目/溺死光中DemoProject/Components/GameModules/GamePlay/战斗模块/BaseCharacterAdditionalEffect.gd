extends RefCounted;
class_name BaseCharacterAdditionalEffect;

# 角色战斗时的附加效果(BUFF/DEBUFF)文件
# 拥有对应的扩展Lua格式脚本

var buff_name : String = "";
var buff_time : int = 0;		# Buff/Debuff 持续时间(单位:毫秒)

func added(_master : BaseBattleCharacter) -> void :
	pass; # [回调]效果被添加时触发

func removed(_master : BaseBattleCharacter) -> void :
	pass; # [回调]效果被移除时触发

func update_effect(_master : BaseBattleCharacter) -> void :
	pass; # [回调]效果存在时候每帧调用
