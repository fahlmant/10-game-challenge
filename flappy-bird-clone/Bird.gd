extends CharacterBody2D

const JUMP_VELOCITY = -300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("Jump"):
		jump()
	
	move_and_slide()


func jump():
	velocity.y = JUMP_VELOCITY
	$JumpSound.play()
