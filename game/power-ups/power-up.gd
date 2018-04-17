extends Area2D

export var timeout = 7
var name = "generic"

func _ready():
	print("timeout en " + str(timeout))
	self.connect("body_enter", self, "collide")
	set_process(true)

func _process(delta):
	timeout -= delta
	print(timeout)
	if timeout <= 0:
		despawn()

func collide(body):
	var game_node = get_tree().get_root().get_node("game")
	do_the_thing(game_node, body)
	despawn()

func do_the_thing(game_node, body):
	pass

func despawn():
	print("despawn " + name)
	remove_from_group(name)
	queue_free()