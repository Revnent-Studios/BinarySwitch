extends Node
class_name LevelManager

@onready var level = get_tree()

var key
var door

func _ready():
	key = level.get_first_node_in_group("key")
	door = level.get_first_node_in_group("door")



func _on_key_collect_key():
	level.get_first_node_in_group("key").queue_free()
	door.open()
	
