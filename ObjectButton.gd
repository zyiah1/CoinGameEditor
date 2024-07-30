extends Button


func _pressed():
	for node in get_tree().get_nodes_in_group("buttons"):
		node.disabled = false
	disabled = true
	get_parent().get_parent().get_parent().item = name
