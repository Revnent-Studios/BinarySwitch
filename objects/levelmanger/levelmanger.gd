extends Node
class_name LevelManager

@onready var level = get_tree()
@onready var switches = level.get_first_node_in_group("tiles")

var key
var door
var shiftVal = 0
func _ready():
	key = level.get_first_node_in_group("key")
	door = level.get_first_node_in_group("door")



func _on_key_collect_key():
	level.get_first_node_in_group("key").queue_free()
	door.open()

func _process(delta):
	switch()

func switch():
	if Input.is_action_just_pressed("StateShift"):
		if (shiftVal == 0):
			
			switches.set("layer_2/enabled",shiftVal)
			shiftVal = 1
			switches.set("layer_1/enabled",shiftVal)
		else :
			switches.set("layer_2/enabled",shiftVal)
			shiftVal = 0
			switches.set("layer_1/enabled",shiftVal)
