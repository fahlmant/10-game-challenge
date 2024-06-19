extends Node

var brick_scene = preload("res://Brick.tscn")

func _ready() -> void:
	new_game()

func new_game():
	for i in range(0,12):
		for j in range(0,10):
			var brick = brick_scene.instantiate()
			$Bricks.add_child(brick)
			brick.position.x = 100 * i + 100
			brick.position.y = 40 * j + 50
