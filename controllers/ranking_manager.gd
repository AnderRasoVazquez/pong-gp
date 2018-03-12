extends Node

#	var ranking = {
#		entries = [
#			{
#				name = "ander",
#				score = 200,
#				game_mode = "cpu_vs"
#			},
#			{
#				name = "ander",
#				score = 200,
#				game_mode = "cpu_vs"
#			}
#		]
#	}
var _ranking = {}
var _PASS = "1234"


func _ready():
	_load_saved_ranking()
	if _ranking.empty():
		_ranking = {
			entries = []
		}


# Load a saved ranking if exists
func _load_saved_ranking():
	var savegame = File.new()
	if !savegame.file_exists("user://savegame.save"):
		return
	var err = savegame.open_encrypted_with_pass("user://savegame.save", File.READ, _PASS)
	var currentline = {}
	currentline.parse_json(savegame.get_line())
	_ranking = currentline
	_sort_ranking()


# Sort ranking by scores
func _sort_ranking():
	_ranking["entries"].sort_custom(MyCustomSorter, "sort")


# Return current ranking
func get_ranking():
	return _ranking


# Save ranking
func _save_ranking():
	var savegame = File.new()
	var err = savegame.open_encrypted_with_pass("user://savegame.save", File.WRITE, _PASS)
	savegame.store_line(_ranking.to_json())
	savegame.close()


# Class to sort scores
class MyCustomSorter:
	static func sort(a, b):
		if a["score"] < b["score"]:
			return false
		return true


# Delete from the end of the list until the array reaches desired size
func _delete_surplus_scores(list_size=10):
	var entries = _ranking["entries"]
	var current_size = entries.size()
	while current_size > list_size:
		entries.remove(current_size - 1)
		current_size = entries.size()


# Adds a new score to the ranking
# returns true if it's a highscore
func add_score(pScore, pGame_mode):
	if login_manager.current_user == null:
		print("No se ha iniciado sesión así que no se guardará la puntuación")
		return false
	var d = {
		name = login_manager.current_user,
		score = pScore,
		game_mode = pGame_mode
	}
	var high_score = false
	var entries = _ranking["entries"]
	if (entries.size() == 0) or _is_high_score(pScore):
		high_score = true
	entries.append(d)
	_sort_ranking()
	_delete_surplus_scores()
	_save_ranking()
	return high_score


# Given a score returns true if it's a highscore
func _is_high_score(score):
	for entry in _ranking["entries"]:
		if score < entry["score"]:
			return false
	return true


