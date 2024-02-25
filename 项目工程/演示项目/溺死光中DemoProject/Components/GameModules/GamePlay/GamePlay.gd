extends Node;

# 玩法模块
# 实现玩法功能

var battle_manager : PackedScene = load("res://Components/GameModules/GamePlay/战斗模块/Battle/BattleManager/BattleManager.tscn");

var register_effect_table : Dictionary = {};		# 注册的效果

func register_effect(type : String, display_name : String,
		 tip : String) :
	if (has_effect(type)) :
		return;
	var reg_effect = BaseAdditionalEffect.new();
	reg_effect.display_name = display_name;
	reg_effect.display_tip = tip;
	reg_effect.type = type;
	register_effect_table[type] = reg_effect;
	# 注册一个战斗附加效果(Buff)
	# type : Buff的类型
	# effect_name : Buff的显示名称
	# tip : Buff的提示
func unregister_effect(type : String) :
	if (!has_effect(type)) :
		return false;
	register_effect_table[type].erase(type);
	return true;
func has_effect(type : String) :
	for effect in register_effect_table :
		if (effect.type == type) :
			return true;
	return false;
	# 检查一个指定效果是否被注册
func get_effect_data(type : String, level : int, keep : int) :
	if (!has_effect(type)) :
		return;
	var effect : BaseAdditionalEffect = register_effect_table[type].duplicate(true);
	effect.level = level;
	effect.keep = keep;
	return effect;
	# 构建一个新的Buff实例
