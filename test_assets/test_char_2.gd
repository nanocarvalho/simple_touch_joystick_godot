extends Node2D

@onready var joystick_touch: Control = $"../Control/joy_left"

func _process(_delta: float) -> void:
	position += joystick_touch._get_direction()
