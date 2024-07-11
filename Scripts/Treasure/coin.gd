extends RigidBody2D

@export var _value : int = 1
@onready var _sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var _sfx : AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body):
	_sfx.play()
	# if the object colliding isn't a character, ignore
	if not body is Character:
		return
	# prevents player from hitting the same coin twice
	collision_mask = 0
	$/root/Game.collect_coin(_value)
	_sprite.play("effect")
	await _sprite.animation_finished
	queue_free()
