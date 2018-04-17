extends Label

var points = 0
onready var time_start = OS.get_unix_time()

func _ready():
	set_process(true)
	
func _process(delta):
	time_elapsed()


func time_elapsed():
	var time_now = OS.get_unix_time()
	points = time_now - time_start
	var minutes = points / 60
	var seconds = points % 60
	var str_points = "%02d : %02d" % [minutes, seconds]
	if (get_text() != str_points):
		add_color_override("font_color", Color(1,0,0))
		set_text(str_points)
		add_color_override("font_color", Color(1,1,1))