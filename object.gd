extends Sprite2D
var drag
@onready var id = get_parent().nodes.size()
var objname = "Mus_CoinGameLight"

@onready var data = [
		  "          - comment: !l -1",
			"            dir_x: 0.00000",
			"            dir_y: 0.00000",
			"            dir_z: 0.00000",
			"            id_name: obj" + str(get_parent().idnumber),
			"            layer: LC",
			"            link_info: []",
			"            link_num: !l 0",
			"            name: "+objname,
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
			"            pos_x: " + str(position.x),
			"            pos_y: " + str(-position.y),
			"            pos_z: 0.00000",
			"            scale_x: 1.00000",
			"            scale_y: 1.00000",
			"            scale_z: 1.00000"]

func _ready():
	get_parent().idnumber += 1
	match objname:
#		"Mus_CoinGameLight":
		"Mus_CoinGameSkull":
			texture = preload("res://ObjUI/Skull.png")
		"Mus_CoinGamePin":
			texture = preload("res://ObjUI/PinSmall.png")
		"Mus_CoinGamePinBig":
			texture = preload("res://ObjUI/PinBig.png")
		"Mus_BoundRound":
			texture = preload("res://ObjUI/Bounce.png")
		"Mus_BoundL":
			texture = preload("res://ObjUI/BounceTilt.png")
		"Mus_BoundR":
			texture = preload("res://ObjUI/BounceTiltflip.png")
		"Mus_CoinGameWall":
			texture = preload("res://ObjUI/Bar.png")
		"Mus_CoinGameWallL":
			texture = preload("res://ObjUI/BarTilt.png")
		"Mus_CoinGameWallR":
			texture = preload("res://ObjUI/BarTiltflip.png")


func _process(delta):
	id = get_parent().nodes.find(self)
	
	if get_parent().item == "delete":
		if $Button.is_hovered():
			modulate = Color(10,.5,.5,1)
		else:
			modulate = Color.WHITE
	else:
		modulate = Color.WHITE
	if drag == true:
		if get_parent().item == "delete":
			get_parent().nodes.remove_at(id)
			queue_free()
		if get_parent().item == "property":
			if get_parent().propertypanel == false:
				get_parent().propertypanel = true
				data[21] = "            pos_x: " + str(position.x)
				data[22] = "            pos_y: " + str(-position.y)
				get_parent().parse(data)
				get_parent().editednode = self
				return
		else:
			position = get_global_mouse_position().round()
	if is_queued_for_deletion():
		get_parent().idnumber -= 1

func reposition():
	position.x = int(data[21].lstrip("            pos_x: "))
	position.y = -int(data[22].lstrip("            pos_y: "))

	
	





func EXPORT():
	print("lamp oil, rope, bombs")
	data[21] = "            pos_x: " + str(position.x)
	data[22] = "            pos_y: " + str(-position.y)
	get_parent().objectdata += data


func _on_button_button_down():
	drag = true


func _on_button_button_up():
	drag = false
