extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Panel/login_btn").connect("pressed", self, "_on_login_btn_pressed")
	get_node("Panel/register_btn").connect("pressed", self, "_on_register_btn_pressed")
	get_node("Panel/passw_txt").set_secret(true)


func _on_login_btn_pressed():
	var user = get_node("Panel/user_txt").get_text()
	var passw = get_node("Panel/passw_txt").get_text()
	
	if login_manager.login(user, passw):
		print("login ok mover al juego")
		get_tree().change_scene("res://ui/main_menu/main_menu.tscn")
	else:
		get_node("Panel/error_login_label").show()

func _on_register_btn_pressed():
	get_tree().change_scene("res://ui/register/register_ui.tscn")