extends Node2D

var header = [
"Version: 1",
"IsBigEndian: True",
"SupportPaths: False",
"HasReferenceNodes: False",
"root:",
"  LayerInfos:",
"    - Infos:",
"        ObjInfo:",
"          - comment: !l -1",
"            dir_x: 0.00000",
"            dir_y: 0.00000",
"            dir_z: 0.00000",
"            id_name: obj0",
"            layer: LC",
"            link_info: []",
"            link_num: !l 0",
"            name: Mus_CoinGameBoard",
"            param0: -1.00000",
"            param1: -1.00000",
"            param10: -1.00000",
"            param11: -1.00000",
"            param2: -1.00000",
"            param3: -1.00000",
"            param4: -1.00000",
"            param5: -1.00000",
"            param6: -1.00000",
"            param7: -1.00000",
"            param8: -1.00000",
"            param9: -1.00000",
"            pos_x: 0.00000",
"            pos_y: 0.00000",
"            pos_z: 0.00000",
"            scale_x: 1.00000",
"            scale_y: 1.00000",
"            scale_z: 1.00000"
]

var endingthang = [
"        RailInfos:",
"          PathInfo: []",
"      LayerName: LC",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L1",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L2",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L3",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L4",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L5",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L6",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L7",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L8",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L9",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L10",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L11",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L12",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L13",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L14",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L15",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L16",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L17",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L18",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L19",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L20",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L21",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L22",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L23",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L24",
"    - Infos:",
"        ObjInfo: []",
"        RailInfos:",
"          PathInfo: []",
"      LayerName: L25"
]

var objectdata = []

signal EXPORT
var item = ""
#current item to place
var idnumber = 1
#id: obj35 or id: obj11
var nodes = []
var namefocus = false
var filename = ""
var load = false
var propertypanel = false
var editednode = null

func _ready():
	$AutoSaveTime.start(Options.autosaveinterval)
	if get_tree().get_current_scene().name == "Creator":
		load = true
	if load == true:
		$Camera.enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	itemplace(delta)
	shortcuts(delta)

func itemplace(delta):
	if Input.is_action_just_pressed("objadd"):
		var instance = preload("res://lamp.tscn").instantiate()
		if item == "Lamp":
			instance.objname = "Mus_CoinGameLight"
		if item == "Skull":
			instance.objname = "Mus_CoinGameSkull"
		if item == "Pegsmall":
			instance.objname = "Mus_CoinGamePin"
		if item == "Pegbig":
			instance.objname = "Mus_CoinGamePinBig"
		if item == "Bounce":
			instance.objname = "Mus_BoundRound"
		if item == "BounceTiltL":
			instance.objname = "Mus_BoundL"
		if item == "BounceTiltR":
			instance.objname = "Mus_BoundR"
		if item == "Bar":
			instance.objname = "Mus_CoinGameWall"
		if item == "BarTiltL":
			instance.objname = "Mus_CoinGameWallL"
		if item == "BarTiltR":
			instance.objname = "Mus_CoinGameWallR"
		instance.position = Vector2(roundi(get_global_mouse_position().x),roundi(get_global_mouse_position().y))
		add_child(instance)
		connect("EXPORT",Callable(instance, "EXPORT"))
		nodes.append(instance)

func shortcuts(delta):
	if Input.is_action_just_pressed("esc"):
		if Options.saveonexit == "true":
			$UI/Name.hide()
			_on_save_pressed()
		get_tree().change_scene_to_file("res://title.tscn")
	if Input.is_action_just_pressed("undo"):
		if nodes.size() != 0:
			nodes[nodes.size()-1].queue_free()
			nodes.remove_at(nodes.size()-1)
	if Input.is_action_just_pressed("Copy"):
		DisplayServer.clipboard_set(str(await export()))
	if Input.is_action_just_pressed("export"):
		await export()
		if $UI/Name.text == "":
			OS.shell_open(str("file://" + ProjectSettings.globalize_path(Options.filepath) + "/untitled.txt"))
		else:
			OS.shell_open(str("file://" + ProjectSettings.globalize_path(Options.filepath) + "/" + $UI/Name.text + ".txt"))



func _on_save_pressed():
	export()

func export():
	objectdata = []
	emit_signal("EXPORT")
	var data = header + objectdata + endingthang
	var output = ""
	if namefocus == false:
		var prename = $UI/Name.text
		if $UI/Name.text == "":
			$UI/Name.text = "untitled"
		filename = $UI/Name.text
		$UI/saveText.show()
		emit_signal("EXPORT")
		
		var path = Options.filepath + "/" + $UI/Name.text + ".txt"
		var file = FileAccess.open(path,FileAccess.WRITE)
		if file.open(Options.filepath + "test" + ".txt", file.WRITE):
			file.open(Options.filepath + "test" + ".txt", file.WRITE)
			for content in data:
				file.store_line(content)
				output += content
				output += "\n"
			file.close()
			$UI/Name.text = prename
			
	
	
	var t = Timer.new()
	
	t.one_shot = true
	add_child(t)
	t.start(.1)
	await(t.timeout)
	$UI/saveText.hide()
	t.queue_free()
	return output


func parse(data):
	for line in data:
		var Edit = preload("res://LineEdit.tscn").instantiate()
		Edit.text = line
		Edit.add_to_group("Data")
		$UI/Property/ScrollContainer/VBox.add_child(Edit)
	if Options.scrollbg == "false":
		$UI/Property/Animation.speed_scale = 100
	$UI/Property/Animation.play("IN")


func _on_auto_save_time_timeout():
	if $Camera.namefocus == false:
		export()
