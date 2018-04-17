extends "res://game/pong.gd"

const gamemode = "EASY"
var moving = "up"

func _ready():
	#Set the right paddle as computer-controlled.
	paddleR.set_player_controlled(false)

func _process(delta):
	control_pad()

func control_pad():
	#if (ball.get_pos().y < paddleR.get_pos().y):
		#paddleR.move_up()
	#if (ball.get_pos().y > paddleR.get_pos().y):
		#paddleR.move_down()
	if moving == "up":
		paddleR.move_up()
	else:
		paddleR.move_down()
	var paddle_pos = paddleR.get_pos()
	if paddle_pos.y > screen_size.y*0.95 or paddle_pos.y < screen_size.y*0.05:
		paddle_flip()

func paddle_flip():
	if moving == "up":
		moving = "down"
	else:
		moving = "up"