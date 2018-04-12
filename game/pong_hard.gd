extends "res://game/pong.gd"

const gamemode = "HARD"
var bamboozle
var moving = "up"

func _ready():
	#Set the right paddle as computer-controlled.
	paddleR.set_player_controlled(false)

func _process(delta):
	control_pad()

func control_pad():
	var closest_ball = null
	var balls = get_tree().get_nodes_in_group("balls")
	for ball in balls:
		if closest_ball == null or ball.get_pos().x > closest_ball.get_pos().x:
			closest_ball = ball
	if (closest_ball.direction.x < 0 && !bamboozle):
		if (screen_size.y/2 < paddleR.get_pos().y):
			moving = "up"
			paddleR.move_up()
		if (screen_size.y/2 > paddleR.get_pos().y):
			moving = "down"
			paddleR.move_down()
		if (screen_size.y/2 == paddleR.get_pos().y):
			bamboozle = true
	elif (closest_ball.direction.x > 0):
		bamboozle = false
		if (closest_ball.get_pos().y < paddleR.get_pos().y):
			moving = "up"
			paddleR.move_up()
		if (closest_ball.get_pos().y > paddleR.get_pos().y):
			moving = "down"
			paddleR.move_down()
	elif (bamboozle):
		if (paddleR.get_pos().y > 3*screen_size.y/8 && moving == "up"):
			paddleR.move_up()
			if (paddleR.get_pos().y <= 3*screen_size.y/8):
				moving="down"
		if (paddleR.get_pos().y <= 5*screen_size.y/8 && moving == "down"):
			paddleR.move_down()
			if (paddleR.get_pos().y >= 5*screen_size.y/8):
				moving="up"
