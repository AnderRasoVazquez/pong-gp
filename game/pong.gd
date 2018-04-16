extends Node2D

const ball_scene = preload("res://game/ball.tscn")
const gamemode = ""
var player1_score = 0
var player2_score = 0

onready var screen_size = get_viewport_rect().size
onready var paddleL = get_node("PaddleL")
onready var paddleR = get_node("PaddleR")
onready var score1_label = get_node("UI").get_node("Score1")
onready var score2_label = get_node("UI").get_node("Score2")
var ball
var win_points = 21

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
		if (ball_pos.x < 0):
			player2_score +=1
			score2_label.set_text(str(player2_score))
		if (ball_pos.x > screen_size.x):
			player1_score +=1
			score1_label.set_text(str(player1_score))
		if player1_score >= win_points:
			get_node("UI/PanelP1Win").show()
			get_tree().set_pause(true)
		elif player2_score >= win_points:
			get_node("UI/PanelP2Win").show()
			get_tree().set_pause(true)
			
		# Current ball is destroyed and a new one is created.
		ball.queue_free()
		ball = ball_scene.instance()
		get_parent().add_child(ball)
		ball.set_pos(screen_size/2)