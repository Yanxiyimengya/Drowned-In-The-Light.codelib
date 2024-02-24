extends RefCounted;
class_name BaseAdditionalEffect;

# 角色战斗时的附加效果(BUFF/DEBUFF)文件
# 拥有对应的扩展Lua格式脚本

var buff_name : String = "";
var buff_time : float = 1;		# Buff/Debuff 持续时间(单位:秒)

func added(_master : BattleCharacter) -> void :
	pass; # [回调]效果被添加时触发

func removed(_master : BattleCharacter) -> void :
	pass; # [回调]效果被移除时触发

func on_battle_event(char : BattleCharacter, event : BattleEvent) :
	pass;
	# 在战斗时 接收到某一事件时触发
