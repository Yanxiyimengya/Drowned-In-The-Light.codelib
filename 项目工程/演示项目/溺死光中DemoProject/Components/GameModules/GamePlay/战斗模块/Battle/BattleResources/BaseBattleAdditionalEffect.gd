extends Timer;
class_name BaseBattleAdditionalEffect;

# 角色战斗Buff实例

var master : BattleCharacter = null;
var effect_data : BaseAdditionalEffect = null;
var buff_time : float = 0.0 :
	set(value) :
		wait_time = buff_time;
	get :
		return wait_time;

func _init(_master : BattleCharacter, _effect_data : BaseAdditionalEffect):
	master = _master;
	effect_data = _effect_data;
	buff_time = _effect_data.buff_time;
	autostart = true;
	pass;

func _ready():
	effect_data.added(master);
	self.timeout.connect(func() :
		effect_data.removed(master);
		self.queue_free();
		pass;
		);

