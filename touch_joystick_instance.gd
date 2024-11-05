extends Control

func _enter_tree() -> void:
	var joy_touch: TouchScreenButton = preload("res://joystick_touch.tscn").instantiate()
	remove_child($placement)
	add_child(joy_touch)

func _get_direction() -> Vector2:
	return get_child(0).direction_vector
