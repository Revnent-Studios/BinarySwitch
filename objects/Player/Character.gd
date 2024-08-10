extends player

@onready var animtree = $"AnimationTree"

func _ready():
	# initializes variables
	animtree.active = true

func _process(delta):
	pass
	
func _physics_process(delta):
	playerMovement(delta)	
	if Input.is_action_just_pressed("Jump"):
		
		Jump(delta)
	if Input.is_action_just_pressed("Dash"):
		if dash:
			Dash(delta)
		
	if is_on_floor():
		walljump = true
		dash = true
	else:
		Fall(delta)
		
	if is_on_wall_only():
		onwall = true
	else:
		onwall = false
