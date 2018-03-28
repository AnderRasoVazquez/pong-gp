extends Control


func _ready():
	get_node("Panel/Volver").connect("pressed", self, "_on_back_pressed")
	
	var ranking = ranking_manager.get_ranking()
	var i = 1
	for entry in ranking["entries"]:
		var label = Label.new()
		var text = "%02dº %25s %25s %25s" % [i, str(entry["name"]), str(entry["score"]), str(entry["game_mode"])]
		#label.set_text(str(i) + "º " + str(entry["name"]) + " " + str(entry["score"]) + " " + str(entry["game_mode"]))
		label.set_text(text)
		get_node("ScrollContainer/VBoxContainer").add_child(label)
		i += 1


func _on_back_pressed():
	get_tree().change_scene("res://ui/main_menu/main_menu.tscn")
