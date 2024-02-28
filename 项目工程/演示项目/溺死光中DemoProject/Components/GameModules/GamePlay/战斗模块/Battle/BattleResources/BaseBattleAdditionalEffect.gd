extends Node;
class_name BaseBattleAdditionalEffect;

# 角色战斗Buff实例节点

var effect_owner: BattleCharacter = null;		# 所有者
var effect_data : BaseAdditionalEffect = null;	# Buff数据

func _init(_master : BattleCharacter, _effect_data : BaseAdditionalEffect):
	if (!_master.is_inside_tree()) :
		return;
	effect_owner = _master;
	effect_data = _effect_data.duplicate(true);
	effect_owner.add(self);
	pass;

func next_turn():
	effect_data.turn_end_effect(effect_owner);
	effect_data.keep -= 1;

	if (effect_data.keep < 1):
		effect_data.removed(effect_owner);
