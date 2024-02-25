extends Node;
class_name BaseBattleAdditionalEffect;

# 角色战斗Buff实例节点

var effect_data : BaseAdditionalEffect = null; # Buff数据

func _init(_master : BattleCharacter, _effect_data : BaseAdditionalEffect):
	if (!_master.is_inside_tree()) :
		return;
	effect_data = _effect_data.duplicate(true);
	_master.add_child(self);
	pass;


