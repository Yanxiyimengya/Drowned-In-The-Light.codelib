extends RefCounted;
class_name WeightedTurnable;

# 用于抽奖的随机转盘模块

var item_list : Array = [];
var total_weighted : float = 0.0;

func add_item(content, weighted : float) -> RandomItem :
	if (weighted <= 0) :
		return;
	var rad_item : RandomItem = RandomItem.new();
	rad_item.content = content;
	rad_item.weighted = weighted;
	total_weighted += weighted;
	item_list.push_back(rad_item);
	return rad_item; # 添加随机项

func remove_item(rad_item) -> void :
	if (!item_list.has(rad_item)) :
		return; # 没有内容 移除寂寞
	item_list.remove_at(item_list.find(rad_item));
	total_weighted -= rad_item.weighted;
	return; # 移除一个随机项

func reset_weighted(rad_item, weighted : float) -> void :
	if (!item_list.has(rad_item)) :
		return; # 没有内容 修改寂寞
	total_weighted += (weighted-rad_item.weighted);
	rad_item.weighted = weighted;
	return; # 移除一个随机项

func random_result() :
	if (item_list.size() <= 0) :
		return;
	while (true) :
		var rand_value : float = randf() * total_weighted;
		for item in item_list :
			if (rand_value <= item.weighted) :
				item.selected.emit();
				return item.content;
			else :
				rand_value -= item.weighted;
		
		# 异常
		total_weighted = 0;
		for item in item_list :
			total_weighted += item.weighted; # 重新计算总权重
		if (total_weighted <= 0) :
			return; # 退出
		# 混蛋! 这种情况应该不会被触发到吧

class RandomItem :
	signal selected; # 被抽中时触发此信号
	var content = null;
	var weighted : float = 0.0 :
		set(value) :
			if (value > 0) :
				weighted = value;
			# 小于零的数字是被禁止的!
