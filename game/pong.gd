extends Node2D

const ball_scene = preload("res://game/ball.tscn")
const gamemode = ""

onready var screen_size = get_viewport_rect().size
onready var paddleL = get_node("PaddleL")
onready var paddleR = get_node("PaddleR")
var ball

func _ready():
	# First ball is deployed.
	ball = ball_scene.instance()
	add_child(ball)
	ball.set_pos(screen_size/2)
	
	set_process(true)

func _process(delta):
	check_point_scored()


func check_point_scored():
	var ball_pos = ball.get_pos()
	# Check gameover
	if (ball_pos.x < 0 or ball_pos.x > screen_size.x):
		#
		# TODO
		# TODO: Aquí deberían sumarse puntos.
		# TODO
		#
		# Current ball is destroyed and a new one is created.
		ball.queue_free()
		ball = ball_scene.instance()
		get_parent().add_child(ball)
		ball.set_pos(screen_size/2)