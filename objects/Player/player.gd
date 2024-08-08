extends CharacterBody2D

class_name player

# false is 0, true is 1
var state = false

const speed = 300
const jump = 500
const gravity = 1500


func _input(event):
	if event.is_action_pressed("StateShift"):
		# inverts state
		state= !(state)

func Jump(delta):
	velocity.y = -jump

func Fall(delta):
	velocity.y += (gravity*delta)

func playerMovement(delta):
	var vector = getDir()	
	velocity.x = vector.x*speed
	move_and_slide()

func getDir() -> Vector2:
	var inputDir = Vector2.ZERO
	inputDir.x = Input.get_axis("Left", "Right")
	inputDir.y = Input.get_axis("Up", "Down")
	inputDir = inputDir.normalized()
	
	return inputDir
