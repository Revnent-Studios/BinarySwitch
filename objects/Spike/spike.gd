extends Node2D

signal die

func _on_area_2d_body_entered(body):
	if body.is_in_group("balle"):
		get_tree().reload_current_scene()
		
		
