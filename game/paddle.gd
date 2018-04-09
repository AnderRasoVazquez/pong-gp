extends KinematicBody2D

# Constant for pads speed
export var PAD_SPEED = 4
export var control_key_up = "ui_up"
export var control_key_down = "ui_down"
onready var screen_size = get_viewport_rect().size
var slow_timer = 0
var slow_speed

func _ready():
	set_process(true)
	
func _process(delta):
	#Moves the paddle when the corresponding key is pressed.
	var current_pos = get_pos()
	var speed
	if slow_timer > 0:
		speed = slow_speed
		slow_timer -= delta
		if slow_timer <= 0:
			slow_timer = 0
	else:
		speed = PAD_SPEED
	if (current_pos.y > 0 and Input.is_action_pressed(control_key_up)):
	    move(Vector2(0,-1) * speed)
	if (current_pos.y < screen_size.y and Input.is_action_pressed(control_key_down)):
	    move(Vector2(0,1) * speed)

func slow_down(speed, time):
	slow_speed = speed
	slow_timer += time