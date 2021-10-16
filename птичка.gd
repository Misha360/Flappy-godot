extends KinematicBody2D

var vertical_speed = 0

func _physics_process(delta):
	vertical_speed += 9600*delta
	vertical_speed = -8000 if Input.is_action_just_pressed("jump") else vertical_speed
	
	if(test_move(transform, Vector2(5000, vertical_speed)*delta/10)):
		get_tree().reload_current_scene()
	else:
		move_and_slide(Vector2(8000, vertical_speed)*delta)
	
