extends Area2D

func _ready():
	self.connect("body_enter", self, "collide")

func _process(delta):
	pass

func collide(body):
	do_the_thing(body)
	queue_free()

func do_the_thing(body):
	# method to override
	pass