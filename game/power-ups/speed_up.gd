extends "res://game/power-ups/power-up.gd"

export var speed_mult = 1.6
export var fast_time = 3

func _ready():
	name = "speed_up"

func do_the_thing(game_node, body):
	body.overload(speed_mult, fast_time)
