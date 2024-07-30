extends Node

var filepath = "res://"
var saveonexit = "false"
var scrollbg = "true"
var autosaveinterval = 20
var streamer = "false"


func _ready():
	#DisplayServer.window_set_size(DisplayServer.window_get_size())
	var file = FileAccess.open("user://Ttl.settings", FileAccess.READ)
	
	
	
	if file != null:
		var settings = file.get_as_text()
		
		settings = settings.split("\n")
		var filepath = "res://"
		if settings[settings.size()-2] == "end":
			Options.scrollbg = settings[0]
			Options.saveonexit = settings[1]
			Options.filepath = settings[2]
			Options.autosaveinterval = int(settings[3])
			Options.streamer = settings[4]
			
		if get_node_or_null("back") != null:
			if Options.scrollbg == "false":
				$scrollbg/toggle.text = "on"
				$scrollbg/toggle.button_pressed = true
			else:
				$scrollbg/toggle.text = "off"
				$scrollbg/toggle.button_pressed = false
			if Options.saveonexit == "false":
				$saveonexit/saveonexit.text = "off"
				$saveonexit/saveonexit.button_pressed = false
			else:
				$saveonexit/saveonexit.text = "on"
				$saveonexit/saveonexit.button_pressed = true
			if Options.streamer == "false":
				$"Streamer Mode/toggle".text = "off"
				$"Streamer Mode/toggle".button_pressed = false
			else:
				$"Streamer Mode/toggle".text = "on"
				$"Streamer Mode/toggle".button_pressed = true
			$Autosave/LineEdit.text = str(Options.autosaveinterval)
		
		
		
func _process(delta):
	pass

func _on_back_pressed():
	var file = FileAccess.open("user://Ttl.settings",FileAccess.WRITE)
	var content = [Options.scrollbg,
	Options.saveonexit,
	Options.filepath,
	Options.autosaveinterval,
	Options.streamer,
	"end"]
	
	for line in content: file.store_line(str(line))
	file.close()
	get_tree().change_scene_to_file("res://title.tscn")



func _on_setting1_pressed():
	if $scrollbg/toggle.button_pressed == false:
		Options.scrollbg = "true"
		$scrollbg/toggle.text = "off"
	if $scrollbg/toggle.button_pressed == true:
		Options.scrollbg = "false"
		$scrollbg/toggle.text = "on"

func _on_setting2_pressed():
	if $saveonexit/saveonexit.button_pressed == false:
		$saveonexit/saveonexit.text = "off"
		Options.saveonexit = "false"
	if $saveonexit/saveonexit.button_pressed == true:
		$saveonexit/saveonexit.text = "on"
		Options.saveonexit = "true"

func _on_setting3_pressed():
	if $"Streamer Mode/toggle".button_pressed == false:
		$"Streamer Mode/toggle".text = "off"
		Options.streamer = "false"
	if $"Streamer Mode/toggle".button_pressed == true:
		$"Streamer Mode/toggle".text = "on"
		Options.streamer = "true"













func _on_file_window_dir_selected(dir):
	if str(dir).ends_with("/"):
		Options.filepath = dir
	else:
		Options.filepath = dir + "/"



func _on_line_edit_text_changed(new_text):
	Options.autosaveinterval = int($Autosave/LineEdit.text)
	$Autosave/LineEdit.text = str(int($Autosave/LineEdit.text))
