extends BaseEvent;
class_name BattleEvent;

# 战斗事件
# 同时也是MOD/DLC对外公开的战斗接口

func _init() -> void :
	pass;

func trigger_event(arguments : Array = [{}]) -> void :
	super(arguments);
