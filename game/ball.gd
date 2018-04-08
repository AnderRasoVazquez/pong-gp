extends KinematicBody2D

# Constant for initial ball speed (in pixels/second).
export var INITIAL_BALL_SPEED = 2
# Constant for ball acceleration when hitting a paddle.
export var BALL_ACCELERATION = 1.1
# Current speed of the ball (also in pixels/second).
var ball_speed = INITIAL_BALL_SPEED
var direction

onready var screen_size = get_viewport_rect().size

func _ready():
	randomize()
	direction = Vector2(1, randf()*2 -1)
	
	set_process(true)
	
func _process(delta):
	# Check if ball bounces on the walls.
	check_bounce()
	# Check if the ball hits a paddle.
	check_hit()
	# Ball movement:
	move(direction * ball_speed)
	
func check_bounce():
	# Get current position of the ball
	var current_pos = get_pos()
	# Change direction when bouncing on roof or floor:
	if ((current_pos.y < 0 and direction.y < 0) or (current_pos.y > screen_size.y and direction.y > 0)):
	    direction.y = -direction.y
	
func check_hit():
	# Check if the ball is touching a pafddle.
	if get_collider():
		ball_speed = ball_speed*BALL_ACCELERATION
		direction.x = -direction.x
		print(direction.y)
		direction.y = direction.y + (randf()*2-1)/2
		print(direction.y)