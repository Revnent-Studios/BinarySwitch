extends Node2D

@onready var tile_map = $TileMap


func _on_key_collect_key():
	tile_map.set("layer_3/enabled",0)
	tile_map.set("layer_4/enabled",1)
