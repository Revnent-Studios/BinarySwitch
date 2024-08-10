extends Node2D

signal collectKey

var x:int = 0

func droneIdle():
	var idleTween
	idleTween = create_tween()
	idleTween.set_loops(-1)
	idleTween.tween_property(self,"position",Vector2(position.x,position.y+2),0.5)
	idleTween.tween_property(self,"position",Vector2(position.x,position.y-4),0.5)

func _ready():
	droneIdle()

func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	emit_signal("collectKey")
