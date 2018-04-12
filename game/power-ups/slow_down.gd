extends "res://game/power-ups/power-up.gd"

export var slow_speed = 2
export var slow_time = 3

func _ready():
	name = "slow_down"

func do_the_thing(game_node, body):
	if body.last_paddle != null:
		body.last_paddle.slow_down(slow_speed, slow_time)
	print(body.get_pos())
