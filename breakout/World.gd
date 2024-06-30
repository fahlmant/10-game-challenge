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


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		lives -= 1
		if lives <= 0:
			end_game()
		$LivesNumber.text = str(lives)
		$Ball.reset_ball()
		$Ball.position.x = $Paddle.position.x
		$Ball.stop_ball()
		$Timer.start()

func end_game():
	pass


func _on_timer_timeout() -> void:
	$Ball.start_ball()
	$Timer.stop()
