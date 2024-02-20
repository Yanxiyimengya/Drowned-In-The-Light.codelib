extends Resource;
class_name DataImprovement;

var pure_data_improvement = PureDataImprovement.new();
var percentage_improvement = PercentageImprovement.new();

class PureDataImprovement:
	var hp_improvement: int;
	var attack_improvement: int;
	var defence_improvement: int;
	
	func add(pure_data_improvement: PureDataImprovement):
		hp_improvement += pure_data_improvement.hp_improvement;
		attack_improvement += pure_data_improvement.attack_improvement;
		defence_improvement += pure_data_improvement.defence_improvement;
		
	func clear():
		hp_improvement = 0;
		attack_improvement = 0;
		defence_improvement = 0;

class PercentageImprovement:
	var hp_improvement: float;
	var attack_improvement: float;
	var defence_improvement: float;
	var curisity_hit_posibility_improvement: float;
	var curisity_hit_improvement_improvement: float;
	var heal_improvemenet_improvement: float;
	var speed_improvement: float;
	var soul_core_improvement: float;
	
	func add(percent_improvement: PercentageImprovement):
		hp_improvement += percent_improvement.hp_improvement;
		attack_improvement += percent_improvement.attack_improvement;
		defence_improvement += percent_improvement.defence_improvement;
		curisity_hit_improvement_improvement += percent_improvement.curisity_hit_improvement_improvement;
		curisity_hit_posibility_improvement += percent_improvement.curisity_hit_posibility_improvement;
		heal_improvemenet_improvement += percent_improvement.heal_improvemenet_improvement;
		speed_improvement += percent_improvement.speed_improvement;
		soul_core_improvement += percent_improvement.soul_core_improvement;
	
	func clear():
		hp_improvement = 0;
		attack_improvement = 0;
		defence_improvement = 0;
		curisity_hit_improvement_improvement = 0;
		curisity_hit_posibility_improvement = 0;
		heal_improvemenet_improvement = 0;
		speed_improvement = 0;
		soul_core_improvement = 0;

func add(data_improvement: DataImprovement):
	pure_data_improvement.add(data_improvement.pure_data_improvement);
	percentage_improvement.add(data_improvement.percentage_improvement);

func clear():
	pure_data_improvement.clear();
	percentage_improvement.clear();
