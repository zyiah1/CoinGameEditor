extends RigidBody2D



func _process(delta):
	if global_position.y <= -1000:
		queue_free()
