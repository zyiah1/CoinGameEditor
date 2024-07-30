extends Sprite2D



func _process(delta):
	#get_parent().get_node("Sprite2D").position = position + Vector2(0,120)
	if Input.is_action_just_pressed("A"):
		var instance = preload("res://Easter/coin.tscn").instantiate()
		instance.position = position + Vector2(0,120)
		get_parent().add_child(instance)
