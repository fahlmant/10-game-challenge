extends Node

var brick_scene = preload("res://Brick.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	pass
	for i in range(0,8):
		for j in range(0,10):
			var brick = brick_scene.instantiate()
			$Bricks.add_child(brick)
			brick.position.x = 100 * i + 100
			brick.position.y = 50 * j + 100
