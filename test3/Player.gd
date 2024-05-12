extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	var direction = Input.get_axis("left",'right')
	var ydir = Input.get_axis("up","down")

	if direction:
		velocity.x = direction * SPEED
	else:
		#slide mechanics?
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if ydir:
		velocity.y = ydir * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	#print(velocity)

	var viewportRect:=get_viewport_rect()
	position.x=clamp(position.x,0,viewportRect.size.x)
	position.y=clamp(position.y,0,viewportRect.size.y)

	#print(velocity)
	move_and_slide()
