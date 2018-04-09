extends "res://game/pong.gd"

const gamemode = "HARD"

func _ready():
	#Set the right paddle as computer-controlled.
	paddleR.set_player_controlled(false)

func _process(delta):
	control_pad()

func control_pad():
	if (ball.direction.x < 0):
		if (screen_size.y/2 < paddleR.get_pos().y):
			paddleR.move_up()
		if (screen_size.y/2 > paddleR.get_pos().y):
			paddleR.move_down()
	else:
		if (ball.get_pos().y < paddleR.get_pos().y):
			paddleR.move_up()
		if (ball.get_pos().y > paddleR.get_pos().y):
			paddleR.move_down()
