extends Node

var current_score = 0
var high_score = 0

func _ready():
	for pipe in $Pipes.get_children():
		pipe.hit.connect(_on_pipe_hit)
		pipe.score.connect(_on_pipe_score)

func add_pipe():
	pass

func _process(delta):
	for pipe in $Pipes.get_children():
		pipe.position.x -= 2

func _on_pipe_score():
	current_score += 1
	$CurrentScoreNumber.text = str(current_score)
	if current_score > high_score:
		$HighScoreNumber.text = str(current_score)

func _on_pipe_hit():
	print("Game Over")

func _on_end_area_entered(area):
	if area.name == "PipeEnd":
		area.get_parent().queue_free()
