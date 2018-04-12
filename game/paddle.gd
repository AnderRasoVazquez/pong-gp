extends KinematicBody2D

# Constant for pads speed.
export var PAD_SPEED = 4
# Control inputs.
export var control_key_up = "left_move_up"
export var control_key_down = "left_move_down"
# Player or computer controlled.
var player_controlled = true
# Where is the paddle moving.
var moving = "no"

onready var screen_size = get_viewport_rect().size
var slow_timer = 0
var slow_speed

func _ready():
	set_process(true)
	
func _process(delta):
	moving = "no"
	# Check if the player can control the paddle.
	if player_controlled:
		#Moves the paddle when the corresponding key is pressed.
		if (Input.is_action_pressed(control_key_up)):
			move_up()
		if (Input.is_action_pressed(control_key_down)):
			move_down()
	if slow_timer > 0:
		slow_timer -= delta
		if slow_timer <= 0:
			slow_timer = 0

func get_speed():
	var speed
	if slow_timer > 0:
		speed = slow_speed
	else:
		speed = PAD_SPEED
	return speed

func move_up():
	moving = "up"
	var current_pos = get_pos()
	if(current_pos.y - get_node("Sprite").get_texture().get_size().y/2> 0):
		move(Vector2(0,-1) * get_speed())
	
func move_down():
	moving = "down"
	var current_pos = get_pos()
	if(current_pos.y + get_node("Sprite").get_texture().get_size().y/2 < screen_size.y):
		move(Vector2(0,1) * get_speed())
	
func set_player_controlled(boolean):
	player_controlled = boolean
	
func slow_down(speed, time):
	slow_speed = speed
	slow_timer += time
