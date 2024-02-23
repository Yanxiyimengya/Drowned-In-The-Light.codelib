extends BaseEvent;
class_name BattleEvent;

# 战斗事件
# 同时也是MOD/DLC对外公开的战斗接口

func _init():
	exposure = true; # 公开自身

func trigger_event(arguments : Array = [],event_type : String = "") -> void :
	self.type = event_type;
	super(arguments);


