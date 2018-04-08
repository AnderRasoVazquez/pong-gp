extends KinematicBody2D

# Constant for pads speed
export var PAD_SPEED = 2
export var control_key_up = "ui_up"
export var control_key_down = "ui_down"
onready var screen_size = get_viewport_rect().size

func _ready():
	set_process(true)
	
func _process(delta):
	#Moves the paddle when the corresponding key is pressed.
	var current_pos = get_pos()
	if (current_pos.y > 0 and Input.is_action_pressed(control_key_up)):
	    move(Vector2(0,-1) * PAD_SPEED)
	if (current_pos.y < screen_size.y and Input.is_action_pressed(control_key_down)):
	    move(Vector2(0,1) * PAD_SPEED)