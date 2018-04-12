extends Node2D

const ball_scene = preload("res://game/ball.tscn")
const pu_manager_scene = preload("res://game/power-ups/power-up_manager.tscn")

const gamemode = ""
var player1_score = 0
var player2_score = 0

onready var screen_size = get_viewport_rect().size
onready var paddleL = get_node("PaddleL")
onready var paddleR = get_node("PaddleR")
onready var score1_label = get_node("UI").get_node("Score1")
onready var score2_label = get_node("UI").get_node("Score2")
var ball

func _ready():
	#activate_power_ups()
	spawn_ball()
	set_process(true)

func _process(delta):
	var balls = get_tree().get_nodes_in_group("balls")
	for ball in balls:
		check_point_scored(ball)

func activate_power_ups():
	var pu_manager = pu_manager_scene.instance()
	add_child(pu_manager)

func spawn_ball():
	var ball = ball_scene.instance()
	add_child(ball)
	ball.add_to_group("balls")
	ball.set_pos(screen_size/2)

func check_point_scored(ball):
	var ball_pos = ball.get_pos()
	# Check gameover
	if (ball_pos.x < 0 or ball_pos.x > screen_size.x):
		if (ball_pos.x < 0):
			player2_score +=1
			score2_label.set_text(str(player2_score))
		if (ball_pos.x > screen_size.x):
			player1_score +=1
			score1_label.set_text(str(player1_score))
		# Current ball is destroyed and a new one is created.
		ball.remove_from_group("balls")
		ball.queue_free()
		if get_tree().get_nodes_in_group("balls").size() == 0:
			# Current ball is destroyed and a new one is created.
			spawn_ball()