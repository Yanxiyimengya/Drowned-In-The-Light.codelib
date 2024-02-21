extends Resource;
class_name DataImprovement;

var pure_data_improvement: PureDataImprovement = PureDataImprovement.new();
var percentage_improvement: PercentageImprovement = PercentageImprovement.new();

class PureDataImprovement:
	var hp_improvement: int = 0;
	var attack_improvement: int = 0;
	var defense_improvement: int = 0;
	var speed_improvement: float = 0;
	var soul_core_improvement: float = 0;
	
	func add(pure_data_improvement: PureDataImprovement):
		hp_improvement += pure_data_improvement.hp_improvement;
		attack_improvement += pure_data_improvement.attack_improvement;
		defense_improvement += pure_data_improvement.defence_improvement;
		speed_improvement += pure_data_improvement.speed_improvement;
		soul_core_improvement += pure_data_improvement.soul_core_improvement;
	
	func clear():
		hp_improvement = 0;
		attack_improvement = 0;
		defense_improvement = 0;
		speed_improvement = 0;
		soul_core_improvement = 0;

class PercentageImprovement:
	var hp_improvement: float = 0;
	var attack_improvement: float = 0;
	var defense_improvement: float = 0;
	var hit_decount_improvement: float = 0;
	var curisity_hit_posibility_improvement: float = 0;
	var curisity_hit_improvement_improvement: float = 0;
	var heal_improvemenet_improvement: float = 0;
	
	func add(percent_improvement: PercentageImprovement):
		hp_improvement += percent_improvement.hp_improvement;
		attack_improvement += percent_improvement.attack_improvement;
		defense_improvement += percent_improvement.defence_improvement;
		hit_decount_improvement += percent_improvement.hit_decount_improvement
		curisity_hit_improvement_improvement += percent_improvement.curisity_hit_improvement_improvement;
		curisity_hit_posibility_improvement += percent_improvement.curisity_hit_posibility_improvement;
		heal_improvemenet_improvement += percent_improvement.heal_improvemenet_improvement;
	
	func clear():
		hp_improvement = 0;
		attack_improvement = 0;
		defense_improvement = 0;
		hit_decount_improvement = 0;
		curisity_hit_improvement_improvement = 0;
		curisity_hit_posibility_improvement = 0;
		heal_improvemenet_improvement = 0;

func add(data_improvement: DataImprovement):
	pure_data_improvement.add(data_improvement.pure_data_improvement);
	percentage_improvement.add(data_improvement.percentage_improvement);

func clear():
	pure_data_improvement.clear();
	percentage_improvement.clear();
