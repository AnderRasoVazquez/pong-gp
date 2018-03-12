extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Timer").connect("timeout", self, "_on_timer_timeout")

func _on_timer_timeout():
	print("termino")
	get_tree().change_scene("res://ui/login/login_ui.tscn")