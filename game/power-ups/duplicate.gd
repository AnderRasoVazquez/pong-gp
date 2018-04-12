extends "res://game/power-ups/power-up.gd"

export var max_balls = 2

func _ready():
	name = "duplicate"

func do_the_thing(game_node, body):
	if get_tree().get_nodes_in_group("balls").size() < max_balls:
		game_node.spawn_ball()
	print(body.get_pos())
