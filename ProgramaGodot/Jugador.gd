extends KinematicBody2D

const salto = Vector2(0,-1)
const velocidad = 200
const frenar = 0;
const salto_arriba=-550
const gravedad = 20

var movimiento = Vector2()

func _physics_process(delta):  #Controles del personaje
	movimiento.y += gravedad  #gravedad del objeto	
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x=velocidad
		$Sprite.flip_h= false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		movimiento.x=-velocidad
		$Sprite.flip_h= true  #Para invertir la imagen del sprinte
		$Sprite.play("Run")
	else:
		movimiento.x = frenar
		$Sprite.play("Idie")
	if is_on_floor():
		#print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = salto_arriba
	else:
		$Sprite.play("Jump")
	
	move_and_slide(movimiento,salto)
	pass
