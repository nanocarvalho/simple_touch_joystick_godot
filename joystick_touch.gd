extends TouchScreenButton
@onready var base: Sprite2D = $base
@onready var point: Sprite2D = $point

var touch_inside_area: bool = false
var touched: bool = false
var direction_vector: Vector2
var joy_radius: float

func _ready() -> void:
	joy_radius = shape.radius

func _process(_delta: float) -> void:
	if touch_inside_area and Input.is_action_pressed("ui_touch"):
		touched = true

	elif Input.is_action_just_released("ui_touch"):
		_reset_position()
			
	if touched:
		point.global_position = get_global_mouse_position()
		direction_vector = (point.transform.origin - base.transform.origin).normalized()

	point.position = (point.transform.origin - base.transform.origin).limit_length(joy_radius)

func get_direction() -> Vector2:
	return direction_vector
	
func _reset_position() -> void:
	touched = false
	point.global_position = base.global_transform.origin
	direction_vector = Vector2.ZERO

func _on_pressed() -> void:
	touch_inside_area = true

func _on_released() -> void:
	touch_inside_area = false
