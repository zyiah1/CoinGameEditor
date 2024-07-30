extends Button

func _ready():
	var file = FileAccess.open("user://Ttl.settings", FileAccess.READ)
	
	#var content = file.get_as_text()
	
	#content = str(content)
	#content = content.split("\n")
	if file == null:
		print("WELCOME")
		$Node2D/FileWindow.popup(Rect2(-790,-429,1022,580))
	else:
		file.close()





func _pressed():
	get_tree().change_scene_to_file("res://settings.tscn")




func _on_FileWindoe_dir_selected(dir):
	if not str(dir).ends_with("/"):
		Options.filepath = dir + "/"
	else:
		Options.filepath = dir
	Options._on_back_pressed()
