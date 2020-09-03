extends KinematicBody2D

const salto = Vector2(0,-1)
const velocidad_Max = 200
const frenar = 0;
const salto_arriba=-550
const gravedad = 20
const aceleracion = 50

var movimiento = Vector2()

func _physics_process(_delta):  #Controles del personaje
	movimiento.y += gravedad  #gravedad del objeto	
	var friccion = false
	
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x= min(movimiento.x+aceleracion,velocidad_Max)
		$Sprite.flip_h= false
		$Sprite.play("Run")
		
		
	elif Input.is_action_pressed("ui_left"):
		movimiento.x= max(movimiento.x-aceleracion , -velocidad_Max) 
		$Sprite.flip_h= true  #Para invertir la imagen del sprinte
		$Sprite.play("Run")
		
		
	else:
		$Sprite.play("Idie")
		friccion=true
		movimiento.x =lerp(movimiento.x , 0, 0.2)
		
		
	if is_on_floor():
		#print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
			movimiento.y = salto_arriba
			
		if friccion == true :
			movimiento.x = lerp(movimiento.x, 0, 0.2)
			
			
	else:
		if movimiento.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friccion == true :
			movimiento.x = lerp(movimiento.x, 0, 0.05)
	
	movimiento=move_and_slide(movimiento,salto)
	pass
