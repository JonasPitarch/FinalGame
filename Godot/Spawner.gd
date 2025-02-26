extends Node2D

var escenacol = preload("res://Escenas/coleccionable.tscn")
var dificultad = 0

#Hacemos que el timer espere para que el spawn sea completamete random
func _ready():
	$Timer.stop()
	$Timer.wait_time = randf_range(2 , 4)
	$Timer.start()




#Spawnea coleccioanbles
func _on_timer_timeout():
	dificultad += .01
	if $Timer.wait_time > .1 :
		$Timer.wait_time -= .1
	var coleccionable = escenacol.instantiate()
	coleccionable.caidaspeed += dificultad
	add_child(coleccionable)
