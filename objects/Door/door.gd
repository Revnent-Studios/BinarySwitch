extends Node2D

var is_open = false
signal success(is_open)

@onready var animation_player = $"../AnimationPlayer"

@onready var sprite_2d = $Sprite2D

func open():
	is_open = true
	sprite_2d.frame = 1



func _on_area_2d_body_entered(body):
	if body.is_in_group("balle"):
		success.emit(is_open)
		if is_open:
			if animation_player:
				animation_player.play("win")
