extends Area2D

var caidaspeed = 1.0
var espoma = true
var mina = preload("res://Assets/spike.png")
func _ready():
	
	if randf() > .5 :
		espoma = false
	if !espoma:
		$Sprite.texture = mina
#Colisiones del jugador con el Coleccionable o minas
func _on_body_entered(body):
	if body.is_in_group("Player"):
		if espoma:
			body.subirScore()
		else:
			body.dead()	
		queue_free()		

#Hacer que caigan manzanas o minas
func _process(delta):
	position.y += caidaspeed
