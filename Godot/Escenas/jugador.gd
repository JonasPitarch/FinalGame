extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

signal marcup
signal deadplayer
var speed = 100.0
func _physics_process(delta):
	#Aqui cogemos la tecla pulsada y el lado hacia el que nos movemos con la velocidad de movimiento.
	var inputvel = Input.get_axis("ui_left","ui_right")
	var salto = Input.get_action_strength("ui_accept")
	
	#Manejar el salto si esta en el suelo
	if salto !=0 and is_on_floor():
		velocity.y =0
		velocity.y -= salto * 200
		
	#Gravedad	
	if !is_on_floor():
		velocity.y +=10
	
	velocity.x = inputvel * speed
	move_and_slide()
	#Aqui ponemos que si se mueve salte la animacion de correr y sino la de estar parado
	if velocity.x != 0:
		animated_sprite_2d.play("run")
	else: 
		animated_sprite_2d.play("idle")	
	#Aquí cambiamos el lado hacia el que mira el personaje a la hora de correr
	if inputvel != 0:
		animated_sprite_2d.flip_h = inputvel < 0

#Metodo para subir y bajar puntos 
func subirScore():
	$Subirsonido.play()
	emit_signal("marcup")
func dead():
	$Dead.play()
	animated_sprite_2d.play("hurt")
	emit_signal("deadplayer")
