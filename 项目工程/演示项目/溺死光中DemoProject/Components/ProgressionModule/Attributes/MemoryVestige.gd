extends Resource;
class_name MemoryVestige;

enum KIND {
	COLLECT,
	GROW,
	INFLIRATION,
	DISTRIBUTION,
	CONBINATION,
}

var name: String;
var kind: KIND;
var data_improvement = DataImprovement.new();
