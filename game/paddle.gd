extends KinematicBody2D

# Constant for pads speed.
export var PAD_SPEED = 4
# Control inputs.
export var control_key_up = "left_move_up"
export var control_key_down = "left_move_down"
# Player or computer controlled.
var player_controlled = true

onready var screen_size = get_viewport_rect().size

func _ready():
	set_process(true)
	
func _process(delta):
	# Check if the player can control the paddle.
	if player_controlled:
		#Moves the paddle when the corresponding key is pressed.
		if (Input.is_action_pressed(control_key_up)):
			move_up()
		if (Input.is_action_pressed(control_key_down)):
			move_down()
	
func move_up():
	var current_pos = get_pos()
	if(current_pos.y - get_node("Sprite").get_texture().get_size().y/2> 0):
		move(Vector2(0,-1) * PAD_SPEED)
	
func move_down():
	var current_pos = get_pos()
	if(current_pos.y + get_node("Sprite").get_texture().get_size().y/2 < screen_size.y):
		move(Vector2(0,1) * PAD_SPEED)
	
func set_player_controlled(boolean):
	player_controlled = boolean
