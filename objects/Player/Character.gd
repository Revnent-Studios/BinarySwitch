extends player


func _ready():
	# initializes variables
	state = state

func _process(delta):
	pass
	
func _physics_process(delta):

	playerMovement(delta)	
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			Jump(delta)
	if !is_on_floor():
		Fall(delta)

