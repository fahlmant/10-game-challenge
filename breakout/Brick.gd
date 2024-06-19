extends RigidBody2D
class_name Brick

signal hit(brick)

func brick_hit():
	hit.emit(self)
