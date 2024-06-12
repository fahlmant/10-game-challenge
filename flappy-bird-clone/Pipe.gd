extends Node2D

signal score
signal hit

func _on_score_area_body_entered(body):
	score.emit()

func _on_collision_body_entered(body):
	hit.emit()
