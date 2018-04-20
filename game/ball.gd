extends KinematicBody2D

# Constant for initial ball speed (in pixels/second).
export var INITIAL_BALL_SPEED = 3
# Constant for ball acceleration when hitting a paddle.
export var BALL_ACCELERATION = 1.1
# Current speed of the ball (also in pixels/second).
var ball_speed = INITIAL_BALL_SPEED
var direction
var overload_mult = 0
var overload_timer = 0
var last_paddle

onready var screen_size = get_viewport_rect().size
onready var sprite_size = get_node("Sprite").get_texture().get_size()

func _ready():
	randomize()
	direction = Vector2(pow(-1, int(rand_range(0,2))), randf()*2 -1).normalized()
	set_process(true)
	
func _process(delta):
	print(ball_speed)
	# Check if ball bounces on the walls.
	check_bounce()
	# Check if the ball hits a paddle.
	check_hit()
	# Ball movement:
	move(direction * get_speed())
	if overload_timer > 0:
		overload_timer -= delta
		if overload_timer <= 0:
			overload_timer = 0
	
func get_speed():
	var speed = ball_speed
	if overload_timer > 0:
		speed = speed * overload_mult
	return speed
	
func check_bounce():
	# Get current position of the ball
	var current_pos = get_pos()
	# Change direction when bouncing on roof or floor:
	if ((current_pos.y - sprite_size.y/2 < 0 and direction.y < 0) or (current_pos.y + sprite_size.y/2 > screen_size.y and direction.y > 0)):
	    direction.y = -direction.y
	
func check_hit():
	# Check if the ball is touching a paddle.
	if is_colliding():
		var collider = get_collider()
		ball_speed = ball_speed*BALL_ACCELERATION
		direction.x = -direction.x
		if (collider.moving == "up"):
			direction.y = direction.y - abs(direction.y * 0.25)
		if (collider.moving == "down"):
			direction.y = direction.y + abs(direction.y * 0.25)
		direction.normalized()
		last_paddle = collider

func overload(mult, time):
	overload_mult = mult
	overload_timer += time
