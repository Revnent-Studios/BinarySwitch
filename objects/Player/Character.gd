extends player


func _ready():
	# initializes variables
	state = state

func _process(delta):
	pass
	
func _physics_process(delta):
	print(walljump)
	playerMovement(delta)	
	if Input.is_action_just_pressed("Jump"):
		Jump(delta)
		
	if is_on_floor():
		walljump = true
	else:
		Fall(delta)
		
	if is_on_wall_only():
		onwall = true
	else:
		onwall = false

