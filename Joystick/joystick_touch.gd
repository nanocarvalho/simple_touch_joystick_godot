extends TouchScreenButton
@onready var base: Sprite2D = $base
@onready var point: Sprite2D = $point

#Joy config
var joy_index: int = -1
var helded: bool 
var direction_vector: Vector2
var joy_radius: float

func _ready() -> void:
	joy_radius = shape.radius
	pressed.connect(_touch_pressed)
	released.connect(_touch_released)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if helded and joy_index == -1:
			joy_index = event.index
			get_viewport().set_input_as_handled()
		elif event.index == joy_index:
			_reset_position()
			get_viewport().set_input_as_handled()
		
	elif event is InputEventScreenDrag:
		if event.index == joy_index:
			point.global_position = event.position
			point.position = (point.transform.origin - base.transform.origin).limit_length(joy_radius)
			direction_vector = (point.transform.origin - base.transform.origin).normalized()
			get_viewport().set_input_as_handled()

func _reset_position() -> void:
	joy_index = -1
	point.global_position = base.global_transform.origin
	direction_vector = Vector2.ZERO

func _touch_pressed() -> void:
	helded = true

func _touch_released() -> void:
	helded = false
