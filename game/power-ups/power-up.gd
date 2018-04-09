extends Area2D

func _ready():
	self.connect("body_enter", self, "collide")

func _process(delta):
	pass

func collide(body):
	var game_node = get_tree().get_root().get_node("game")
	do_the_thing(game_node, body)
	queue_free()

func do_the_thing(game_node, body):
	# method to override
	pass