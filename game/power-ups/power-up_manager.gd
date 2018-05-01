extends Node2D

export var max_duplicate_pu = 3
export var max_speed_pu = 4
export var max_slow_pu = 4
export var spawn_chance = 0.5
const pu_names = ["duplicate", "speed_up", "slow_down"]
var screen_size

func _ready():
	randomize()
	screen_size = get_parent().screen_size
	set_process(true)

func _process(delta):
	if rand_range(0,2) < spawn_chance*delta:
		spawn_pu(pu_names[randi()%pu_names.size()])

func spawn_pu(pu_name):
	var power_up = null
	var tree = get_tree()
	if pu_name == pu_names[0]: # duplicate
		if tree.get_nodes_in_group(pu_name).size() < max_duplicate_pu:
			power_up = load("res://game/power-ups/duplicate.tscn").instance()
	elif pu_name == pu_names[1]: # speed up
		if tree.get_nodes_in_group(pu_name).size() < max_speed_pu:
			power_up = load("res://game/power-ups/speed_up.tscn").instance()
	elif pu_name == pu_names[2]: # slow down
		if tree.get_nodes_in_group(pu_name).size() < max_slow_pu:
			power_up = load("res://game/power-ups/slow_down.tscn").instance()
	if power_up != null:
		var x = screen_size.x
		var y = screen_size.y
		var pos = Vector2(rand_range(x*25/100, x*75/100),rand_range(y*20/100, y*80/100))
		power_up.set_pos(pos)
		add_child(power_up)
		power_up.add_to_group(pu_name)