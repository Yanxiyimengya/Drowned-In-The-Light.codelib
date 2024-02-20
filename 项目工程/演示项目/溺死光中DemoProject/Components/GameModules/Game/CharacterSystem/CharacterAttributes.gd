extends Resource;
class_name CharacterAttributes;

# 表示角色属性的类

var hp : int = 0;							# 角色生命值
var attack : float = 0.0;					# 角色攻击力
var defense : float = 0.0;					# 角色防御力
var speed : float = 0.0;					# 角色速度
var hit_probability : float = 0.0;			# 角色命中率
var therapy : float = 0.0;					# 角色治疗量
var therapy_fixed : float = 0.0;			# 角色治疗修正
var critical_hit : float = 0.0;				# 角色暴击概率
var critical_hit_fixed : float = 0.0;		# 角色暴击修正
var critical_hit_injury : float = 0.0;		# 角色暴击伤害倍率
var soul_core : float = 0;					# 核灵

static func load_form_file(file_path : String) -> CharacterAttributes :
	if (!FileAccess.file_exists(file_path)) :
		return null;
	var attaributes : CharacterAttributes = CharacterAttributes.new();
	return attaributes;
