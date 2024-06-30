extends Node

var brick_scene = preload("res://Brick.tscn")

var score: int = 0
var lives: int = 3

func _ready() -> void:
	new_game()

func new_game():
	score = 0
	lives = 3
	for i in range(0,12):
		for j in range(0,10):
			var brick = brick_scene.instantiate()
			brick.position.x = 100 * i + 100
			brick.position.y = 40 * j + 50
			brick.hit.connect(_on_brick_hit)
			$Bricks.call_deferred("add_child", brick)

func _on_brick_hit(body): 
	# Increase Score
	score += 1
	$ScoreNumber.text = str(score)
	body.queue_free()
