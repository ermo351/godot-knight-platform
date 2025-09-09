extends Area2D

@onready var timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	Engine.time_scale = 0.5
	# spadanie po śmierci
	
	body.get_node("CollisionShape2D").queue_free()
	var hurt_sound = body.get_node("HurtSound")
	hurt_sound.play()

	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
