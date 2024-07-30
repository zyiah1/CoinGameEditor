extends Sprite2D

var preset = preload("res://FunctionPresets.tscn")



func _on_Functions_pressed():
	if $ScrollContainer.visible == true:
		for node in $FunctionContainer.get_children():
			$FunctionContainer.remove_child(node)
		$ScrollContainer.hide()
		$FunctionContainer.show()
		$FunctionContainer.add_child(preset.instantiate())

func _on_Property_pressed():
	$ScrollContainer.show()
	$FunctionContainer.hide()
