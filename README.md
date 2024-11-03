A simple touch joystick, made using Godot 4.3

I'm still a beginner so don't expect too much haha I just wanted a simple joystick to control my characters direction and nothing more.
If you want to anchor this onto your UI, make it a child of a control node, and anchor the control node to the desired location.

The usage is simple:
- add the joystick_touch scene, script and assets to the project, make sure they are linked correcty. You can change the assets as you like, just remember to set the touch collsion shape properly for the new size.
- Import the joystick on the Player script/where you wanna to control via joystick.
- Retrieve the vector2 using the get_direction() function, like this:

```
extends CharacterBody2D
@onready var joystick_touch: TouchScreenButton = $"../Joystick_touch"

const SPEED = 100.0

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = joystick_touch.get_direction()
	
	velocity = direction * SPEED
	move_and_slide()

```

I've left an example scene on the project, using a simple node2d with a sprite to show it working you can open the project.godot using the Project Manager and test for yourself. You can safely remove the Demo and test_assets folders, they are used only for testing.
And here it's in action:

![A gif showing how the joystick works, on the left bottom side is the joystick itself and on the right a yellow kinda static character moving according to the direction the joystick is being dragged.](./Demo/demo_touch_joystick.gif)
