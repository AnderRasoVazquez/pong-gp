extends "res://game/power-ups/power-up.gd"

export var fast_speed = 5
export var fast_time = 3

func do_the_thing(game_node, body):
	body.overload(fast_speed, fast_time)
	print(body.get_pos())
