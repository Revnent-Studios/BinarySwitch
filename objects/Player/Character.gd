extends player

@onready var animtree = $AnimationTree
var facing = Vector2.ZERO
var lastpress = 1

func _ready():
	# initializes variables
	animtree.active = true
	
func _physics_process(delta):

	if getDir()[0] == 0:
		facing.x = lastpress
	elif getDir()[0]>0:
		facing.x = 1
		lastpress = 1
	elif(getDir()[0]<1):
		facing.x = -1
		lastpress = -1

	playerMovement(delta)	
	
	if velocity == Vector2.ZERO:
		animtree["parameters/conditions/falling"] = false
		animtree["parameters/conditions/jumping"] = false
		animtree["parameters/conditions/hang"] = false
		animtree["parameters/conditions/running"] = false
		animtree["parameters/conditions/idle"] = true
	else:
		animtree["parameters/conditions/falling"] = false
		animtree["parameters/conditions/jumping"] = false
		animtree["parameters/conditions/hang"] = false
		animtree["parameters/conditions/running"] = true
		animtree["parameters/conditions/idle"] = false
	
	if velocity.y>1 and !is_on_wall():
		print("Falling")
		animtree["parameters/conditions/running"] = false
		animtree["parameters/conditions/idle"] = false
		animtree["parameters/conditions/falling"] = true
		animtree["parameters/conditions/jumping"] = false
		animtree["parameters/conditions/hang"] = false
	elif velocity.y<-1:
		print("Jumping")
		animtree["parameters/conditions/running"] = false
		animtree["parameters/conditions/idle"] = false
		animtree["parameters/conditions/falling"] = false
		animtree["parameters/conditions/jumping"] = true
		animtree["parameters/conditions/hang"] = false
	if is_on_wall():
		animtree["parameters/conditions/falling"] = false
		animtree["parameters/conditions/jumping"] = false
		animtree["parameters/conditions/hang"] = true
		animtree["parameters/conditions/running"] = false
		animtree["parameters/conditions/idle"] = false
	
	if Input.is_action_just_pressed("Jump"):
		Jump(delta)
	if Input.is_action_just_pressed("Dash"):
		if dash:
			Dash(delta)
		
	if is_on_floor():
		walljump = 3
		dash = true
	else:
		Fall(delta)
		
	if is_on_wall_only():
		onwall = true
	else:
		onwall = false
		
	animtree["parameters/Idle/blend_position"] = facing
	animtree["parameters/Running/blend_position"] = facing
	animtree["parameters/WallHang/blend_position"] = facing
	animtree["parameters/Falling/blend_position"] = facing
	animtree["parameters/Jumping/blend_position"] = facing

func freeze():
	pause = true

func unfreeze():
	pause = false
