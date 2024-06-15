extends CharacterBody2D

var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		velocity.x -= 1
	if Input.is_action_pressed("Left"):
		velocity.x += 1 
	
	set_velocity(velocity*speed)
	move_and_slide()
