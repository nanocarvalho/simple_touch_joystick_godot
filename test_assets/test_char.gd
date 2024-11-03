extends Node2D
@onready var joystick_touch: TouchScreenButton = $"../Joystick_touch"

func _process(_delta: float) -> void:
	position += joystick_touch.get_direction()
