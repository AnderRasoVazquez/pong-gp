extends Node

#	var ranking = {
#		entries = [
#			{
#				user = "ander",
#				passw = "lololo"
#			},
#			{
#				user = "ander",
#				passw = "lelele"
#			}
#		]
#	}
var _login = {}
var _PASS = "1234"
var current_user = null

func _ready():
	_load_saved_login()
	if _login.empty():
		_login = {
			entries = []
		}

func _load_saved_login():
	var userdata = File.new()
	if !userdata.file_exists("user://userdata.save"):
		return
	var err = userdata.open_encrypted_with_pass("user://userdata.save", File.READ, _PASS)
	var currentline = {}
	currentline.parse_json(userdata.get_line())
	_login = currentline

func _save_login():
	var userdata = File.new()
	var err = userdata.open_encrypted_with_pass("user://userdata.save", File.WRITE, _PASS)
	userdata.store_line(_login.to_json())
	userdata.close()

# Adds a new login registry
# returns true if user does not exist
func register_user(pUser, pPassw):
	for entry in _login["entries"]:
		if (entry["user"] == pUser):
			return false
	var d = {
		user = pUser,
		passw = pPassw
	}
	var entries = _login["entries"]
	entries.append(d)
	_save_login()
	current_user = pUser
	return true


func login(pUser, pPassw):
	for entry in _login["entries"]:
		if (entry["user"] == pUser) and (entry["passw"] == pPassw):
			current_user = pUser
			return true
	return false

func logout():
	current_user = null


