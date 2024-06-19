extends CharacterBody2D

var speed = 200
var ball_velocity = Vector2.ZERO

func _ready():
	start_ball()

func _physics_process(delta):
	var collision_object = move_and_collide(ball_velocity*speed * delta)
	if collision_object:
		ball_velocity = ball_velocity.bounce(collision_object.get_normal())

func reset_ball():
	position = Vector2(580,560)

func stop_ball():
	speed = 0

func start_ball():
	speed = 200
	ball_velocity.x = [-0.8, 0.8][randi()%2]
	ball_velocity.y = [1,-1][randi()%2]
