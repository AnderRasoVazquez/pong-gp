extends Node2D

export var max_balls = 2
export var max_speed_pu = 3
export var max_slow_pu = 3
export var spawn_chance = 0.15 # por segundo (mas o menos)
const pu_names = ["duplicate", "speed_up", "slow_down"]

func _ready():
	randomize()
	set_process(true)

func _process(delta):
	if rand_range(0,2) < spawn_chance*delta:
		spawn_pu(pu_names[randi()%pu_names.size()])

func spawn_pu(pu_name):
	var power_up = null
	var tree = get_tree()
	print("spawn " + pu_name)
	if pu_name == pu_names[0]: # duplicate
		power_up = load("res://game/power-ups/duplicate.tscn").instance()
	elif pu_name == pu_names[1]: # speed up
		if tree.get_nodes_in_group(pu_name).size() < max_speed_pu:
			power_up = load("res://game/power-ups/speed_up.tscn").instance()
	elif pu_name == pu_names[2]: # slow down
		if tree.get_nodes_in_group(pu_name).size() < max_slow_pu:
			power_up = load("res://game/power-ups/slow_down.tscn").instance()
	if power_up != null:
		var pos = Vector2(rand_range(50,250),rand_range(50,250))
		power_up.set_pos(pos)
		add_child(power_up)
		power_up.add_to_group(pu_name)