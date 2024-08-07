extends CharacterBody2D

class_name player

# false is 0, true is 1
var state = false

const speed = 500
const jump = 2000
const gravity = 120


func _input(event):
	if event.is_action_pressed("StateShift"):
		# inverts state
		state= !(state)

func getDir() -> Vector2:
	var inputDir = Vector2.ZERO
	inputDir.x = Input.get_axis("Left", "Right")
	inputDir = inputDir.normalized()
	
	return inputDir
	
