extends Button

var path = "res://test.txt"
var content = ""
var creator = preload("res://creator.tscn")

func _ready():
	if Options.streamer == "true":
		$FileDialog/Sprite2D.show()

func _on_pressed():
	$FileDialog.current_dir = Options.filepath
	$FileDialog.popup()

func _process(delta):
	if self_modulate != Color(0,0,0,0):
		if Input.is_action_just_pressed("Paste"):
			content = str(DisplayServer.clipboard_get())
			LoadLevel("")


func start():
	
	
	
	var file = FileAccess.open(path, FileAccess.READ)
	
	
	var name = str(path).get_file().left(str(path).get_file().length() - 1)
	name = name.left(name.length() - 1)
	name = name.left(name.length() - 1)
	name = name.left(name.length() - 1)
	content = file.get_as_text()
	
	file.close()
	
	content = str(content)
	
	print(name)
	
	LoadLevel(name)

func LoadLevel(name):
	for nodes in get_tree().get_nodes_in_group("delete"):
		nodes.queue_free()
	content = content.split("\n")
	$Overlay/ProgressBar.max_value = content.size()
	var cycle = 35
	
	self_modulate = Color(0,0,0,0)
	for node in get_tree().get_nodes_in_group("hide"):
		node.hide()
	$Overlay/ProgressBar.show()
	
	
	get_parent().add_child(creator.instantiate())
	
	var scene = get_parent().get_node("Creator")
	scene.get_node("UI").hide()
	scene.get_node("UI/Name").text = name
	var nextid = 0
	var overide = 0
	if content[0] != "Version: 1":
		print("invalid")
	$Overlay/ProgressBar/AudioStreamPlayer.playing = true
	$Camera.enabled = true
	var trackedinfo = []
	var lastnode = null
	for line in content.size():
		#store the actual data in each object
		trackedinfo.append(content[0])
		if content[0].begins_with("            scale_z: "):
			if trackedinfo[1].begins_with("          - comment: !l -1"):
				trackedinfo.remove_at(0)
			if lastnode != null:
				lastnode.data = trackedinfo
			trackedinfo = []
		
		
		$Overlay/ProgressBar.value += 1
		overide = 0
		cycle -= 1
		if cycle + 1 > 0:
			content.remove_at(0)
		else:
			$Overlay/ProgressBar/LineEdit.text = content[8].lstrip(" ")
			$Overlay/ProgressBar/AudioStreamPlayer.pitch_scale = $Overlay/ProgressBar.value/$Overlay/ProgressBar.max_value*10
			if randi_range(1,5) == 5:
				await get_tree().create_timer(.0000001).timeout
			# allow the progress bar to update
			cycle = 27
			print(content[8])
			if content[8].begins_with("            name: "):
				var inst = preload("res://lamp.tscn").instantiate()
				inst.objname = content[8].lstrip("            name: ")
				#set object type
				scene.connect("EXPORT", Callable(inst, "EXPORT"))
				inst.position = Vector2(float(content[21].lstrip("            pos_x: ")),-float(content[22].lstrip("            pos_y: ")))
				scene.add_child(inst)
				#set data
				lastnode = inst
				scene.nodes.append(inst)
				cycle = 27
	if cycle < 0:
		print("Didn't Recognize:" + content[0])
		content.remove_at(0)
	
	
	scene.load = true
	$Overlay/ProgressBar.hide()
	scene.get_node("UI").show()
	$Camera.enabled = false
	scene.get_node("Camera").enabled = true
	$Overlay/ProgressBar/AudioStreamPlayer.playing = false



func _on_file_dialog_file_selected(input):
	path = input
	start()
