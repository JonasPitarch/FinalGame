extends Node
var scoreplayer = 0
@onready var jugador = $Jugador

#Conectamos las 2 señales
func  _ready():
	jugador.connect("marcup", marcup)
	jugador.connect("deadplayer", dead)
	$Musica.play()
#Emite la señal para subir el marcador
func marcup():
	scoreplayer += 1 
	$Puntuacion.text = str(scoreplayer)
#Emite la señal para decir que el jugador a muerto	
func dead():
	$DeadScreen	.show()
	get_tree().paused = true
