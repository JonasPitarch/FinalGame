extends CanvasLayer

# Aqui lo que hacemos es que si pulsamos el boton salir pues salga
func _on_exit_pressed():
	get_tree().quit()

func _on_reset_pressed():
	get_tree().reload_current_scene()


