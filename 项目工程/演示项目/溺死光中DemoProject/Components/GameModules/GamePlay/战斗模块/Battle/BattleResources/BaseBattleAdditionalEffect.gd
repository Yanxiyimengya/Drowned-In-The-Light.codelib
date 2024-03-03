extends Node;
class_name BaseBattleAdditionalEffect;
# 角色战斗Buff实例节点

signal removed;

var effect_data : BaseAdditionalEffect = null; # Buff数据
var keep_wave : int = 0;

func _init(_master : BattleCharacter, _effect_data : BaseAdditionalEffect):
	if (!_master.is_inside_tree()) :
		return;
	effect_data = _effect_data.duplicate(true);
	keep_wave = _effect_data.keep;
	_master.add_child(self);
	pass;

func _on_next_turn() : 
	if (effect_data.has_method(GamePlay.events_method_names.battle_next_turn)) :
		effect_data.call(GamePlay.events_method_names.battle_next_turn);
	keep_wave -= 1;
	if (keep_wave <= 0) :
		removed.emit();
	pass;


