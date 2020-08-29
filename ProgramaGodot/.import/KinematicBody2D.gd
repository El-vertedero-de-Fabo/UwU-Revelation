extends KinematicBody2D


var movimiento = Vector2()
const salto = Vector2(0,-1)

func _physics_process(_delta):
	movimiento.y +=10  #gravedad del objeto	
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x=100
	elif Input.is_action_pressed("ui_left"):
		movimiento.x=-100
	else:
		movimiento.x = 0
	if is_on_floor():
		print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = -400
	
	move_and_slide(movimiento,salto)
	pass
