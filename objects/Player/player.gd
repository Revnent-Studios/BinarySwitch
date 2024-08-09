extends CharacterBody2D

class_name player

# false is 0, true is 1
var state = false
var onwall = false

# if true can wall jump
var walljump = true

# this makes it so that the game does not take input for 0.3 seconds after wall jumping
# this is so that the user does not walk towards the wall as soon as they jump off it
var walljump_input_hold = false

const speed = 300
const jump = 750
const gravity = 2000
const fallspeedcap = 750


func _input(event):
	if event.is_action_pressed("StateShift"):
		# inverts state
		state= !(state)

func Jump(delta):

	if is_on_floor():
		velocity.y = -jump
	elif is_on_wall_only() and walljump:
		
		# wall jump in direction opposite to the wall
		
		if Input.is_action_pressed("Left"):
			
			walljump_input_hold = true
			walljump = false
			
			velocity.y = -jump*2
			velocity.x += 300
			await get_tree().create_timer(0.3).timeout
			walljump_input_hold = false
			
		elif Input.is_action_pressed("Right"):
			
			walljump_input_hold = true
			walljump = false
			
			velocity.y = -jump*2
			velocity.x -= 300
			await get_tree().create_timer(0.2).timeout
			walljump_input_hold = false
			
		


func Fall(delta):
	#print(velocity.y)
	if velocity.y < fallspeedcap:
		velocity.y += (gravity*delta)
	if is_on_wall() and Input.is_action_pressed("Left") or is_on_wall() and Input.is_action_pressed("Right"):
		velocity.y = velocity.y/2
		
	

func playerMovement(delta):
	if !walljump_input_hold:
		var vector = getDir()
		velocity.x = vector.x*speed
	move_and_slide()	

func getDir() -> Vector2:
	var inputDir = Vector2.ZERO
	inputDir.x = Input.get_axis("Left", "Right")
	inputDir.y = Input.get_axis("Up", "Down")
	inputDir = inputDir.normalized()
	
	return inputDir
