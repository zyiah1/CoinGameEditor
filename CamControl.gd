extends Camera2D

var speed = 100
var namefocus = false
var zoom_minimum = Vector2(4,4)
var zoom_maximum = Vector2(25,25)
var zoom_speed = Vector2(.500001,.500001)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().propertypanel == false:
		if enabled == true:
			if namefocus == false:
				var input_vector = Input.get_vector("left","right","up","down")
				if Input.is_action_pressed("shift"):
					position += input_vector * speed/4 * delta
				else:
					position += input_vector * speed * delta
			if Input.is_action_just_pressed("ui_accept"):
				get_parent().get_node("UI/Name").hide()
				get_parent().get_node("UI/Name").show()
				

func _input(event):
	if get_parent().propertypanel == false:
		if event is InputEventMouseButton:
			
			if event.is_pressed():
				if event.button_index == MOUSE_BUTTON_WHEEL_UP:
					if zoom > zoom_minimum:
						zoom -= zoom_speed
				if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
					if zoom < zoom_maximum:
						zoom += zoom_speed

func _on_name_focus_entered():
	namefocus = true


func _on_name_focus_exited():
	namefocus = false
