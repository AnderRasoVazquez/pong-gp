extends "res://game/pong.gd"

const gamemode = "EASY"

func _ready():
	#Set the right paddle as computer-controlled.
	paddleR.set_player_controlled(false)

func _process(delta):
	control_pad()

func control_pad():
	if (ball.get_pos().y < paddleR.get_pos().y):
		paddleR.move_up()
	if (ball.get_pos().y > paddleR.get_pos().y):
		paddleR.move_down()
