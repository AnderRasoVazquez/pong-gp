extends Control


const RankingLabel = preload("res://widgets/LabelRankingResult.tscn")


func _ready():
	get_node("Panel/Volver").connect("pressed", self, "_on_back_pressed")
	
	var ranking = ranking_manager.get_ranking()
	var i = 1
	for entry in ranking["entries"]:
		#var label = Label.new()
		var label = RankingLabel.instance()
		
		var text = "%02dº %25s %25s %25s" % [i, str(entry["name"]), seconds_to_time(entry["score"]), str(entry["game_mode"])]
		#label.set_text(str(i) + "º " + str(entry["name"]) + " " + str(entry["score"]) + " " + str(entry["game_mode"]))
		label.set_text(text)
		get_node("ScrollContainer/VBoxContainer").add_child(label)
		i += 1


func _on_back_pressed():
	get_tree().change_scene("res://ui/main_menu/main_menu.tscn")

func seconds_to_time(points):
	var ppoints = int(points)
	var minutes = ppoints / 60
	# TODO bug al parsear puntuación
	var seconds = ppoints % 60
	var str_points = "%02d : %02d" % [minutes, seconds]
	return str_points
