extends CharacterBody2D

class_name player

# false is 0, true is 1
var state = false
var onwall = false

# if true can wall jump
var walljump = true
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
		# implement wall jump
		
		if Input.is_action_pressed("Left"):
			
			walljump_input_hold = true
			walljump = false
			
			velocity.y = -jump
			velocity.x += 300
			await get_tree().create_timer(0.2).timeout
			walljump_input_hold = false
			
		elif Input.is_action_pressed("Right"):
			
			walljump_input_hold = true
			walljump = false
			
			velocity.y = -jump
			velocity.x -= 300
			await get_tree().create_timer(0.2).timeout
			walljump_input_hold = false
			
		# walljump set to false if jumped when on wall only
		


func Fall(delta):
	#print(velocity.y)
	if !onwall:
		if velocity.y < fallspeedcap:
			velocity.y += (gravity*delta)
	else:
		#velocity.y = 0
		
		# i have no idea why i needed to multiply delta by 5, it's too slow if i dont
		# removing velocity.y = 0 fixes it but we need to set velocity.y to 0 
		
		# make this slowly decrease until it reaches a certain threshhold
		velocity.y += (gravity*delta)

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
