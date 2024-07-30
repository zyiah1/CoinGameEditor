extends Control

@onready var Vbox = get_parent().get_parent().get_node("ScrollContainer/VBox")
var posx = null
var posy = null

func _ready():
	#$HugePanel.hide()
	for child in Vbox.get_children():
		if child.text.begins_with("            pos_x: "):
			posx = child
			print("EX")
		if child.text.begins_with("            pos_y: "):
			posy = child
	$X.text = posx.text.lstrip("            pos_x: ")
	$Y.text = posy.text.lstrip("            pos_y: ")
	if $X.text == "":
		$X.text = "0"
	if $Y.text == "":
		$Y.text = "0"


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$X.hide()
		$Y.hide()
		$X.show()
		$Y.show()



func _on_X_text_changed(new_text):
	posx.text = "            pos_x: " + str(new_text)


func _on_Y_text_changed(new_text):
	posy.text = "            pos_y: " + str(new_text)
