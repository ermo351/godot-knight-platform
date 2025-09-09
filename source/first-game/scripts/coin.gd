extends Area2D

@onready var game_manager = %GameManager
@onready var coin = preload("res://assets/sounds/coin.wav")
@onready var pickup_sound: AudioStreamPlayer2D = %PickupSound
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	pickup_sound.play()
	animated_sprite_2d.visible = false
	await get_tree().create_timer(pickup_sound.stream.get_length()).timeout
	
	queue_free()
