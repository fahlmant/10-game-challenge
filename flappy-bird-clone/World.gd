extends Node

var current_score = 0
var high_score = 0

func _process(delta):
	$Pipe.position.x -= 2

func _on_pipe_score():
	current_score += 1
	if current_score > high_score:
		$HighScoreNumber.text = str(current_score)

func _on_pipe_hit():
	pass # Replace with function body.
