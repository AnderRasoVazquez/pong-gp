extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Panel/back_btn").connect("pressed", self, "_on_back_btn_pressed")
	get_node("Panel/register_btn").connect("pressed", self, "_on_register_btn_pressed")

func _on_back_btn_pressed():
	get_tree().change_scene("res://ui/login/login_ui.tscn")

func _on_register_btn_pressed():
	var user = get_node("Panel/user_txt").get_text()
	var passw = get_node("Panel/pass_txt").get_text()
	var repeat_passw = get_node("Panel/repeat_pass_txt").get_text()
	
	if user == "" or passw == "" or repeat_passw == "":
		print("No puede haber campos vacíos")
		return
	
	if passw != repeat_passw:
		get_node("Panel/wrong_passw").show()
		return
	else:
		get_node("Panel/wrong_passw").hide()
	
	if login_manager.register_user(user, passw):
		get_node("Panel/user_exists").hide()
		get_tree().change_scene("res://ui/main_menu/main_menu.tscn")
		print("bien registrado")
	else:
		get_node("Panel/user_exists").show()
		return
	
	
