extends Control


func _ready():
	get_node("Jugar").connect("pressed", self, "_on_jugar_pressed")
	get_node("Ranking").connect("pressed", self, "_on_ranking_pressed")
	get_node("Salir").connect("pressed", self, "_on_exit_pressed")
	get_node("Logout").connect("pressed", self, "_on_logout_pressed")
	
	get_node("Hi_label").set_text("Hola, " + login_manager.current_user)

	get_node("Add_score").connect("pressed", self, "_on_add_score_pressed")

	get_node("PopupMenu/2 Player").connect("pressed", self, "_on_2p_pressed")
	get_node("PopupMenu/CPU - Easy").connect("pressed", self, "_on_easy_pressed")
	get_node("PopupMenu/CPU - Hard").connect("pressed", self, "_on_hard_pressed")

func _on_add_score_pressed():
	randomize()
	var score = randi() % 201
	print("New Score: " + str(score))
	if ranking_manager.add_score(score, "2 player"):
		print("High Score!!!")


func _on_jugar_pressed():
	get_node("PopupMenu").popup()


func _on_ranking_pressed():
	get_tree().change_scene("res://ui/ranking/ranking_ui.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_2p_pressed():
	get_tree().change_scene("res://game/pong_VS.tscn")


func _on_easy_pressed():
	get_tree().change_scene("res://game/pong_easy.tscn")


func _on_hard_pressed():
	get_tree().change_scene("res://game/pong_hard.tscn")


func _on_logout_pressed():
	login_manager.logout()
	get_tree().change_scene("res://ui/login/login_ui.tscn")
