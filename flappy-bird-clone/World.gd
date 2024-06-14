extends Node

var current_score = 0
var high_score = 0

var pipe_scene = preload("res://Pipe.tscn")

var rng = RandomNumberGenerator.new()
# TODO: Saving high score

func _ready():
	get_tree().paused = true
	show_menu()

func new_game_setup():
	for pipe in $Pipes.get_children():
		pipe.queue_free()
	current_score = 0
	$CurrentScoreNumber.text = str(current_score)
	$Bird.position.x = 240
	$Bird.position.y = 350
	for i in range(0,7):
		var pipe = pipe_scene.instantiate()
		pipe.position.x = 400 + (200*i)
		pipe.position.y = randi_range(380,450)
		pipe.hit.connect(_on_pipe_hit)
		pipe.score.connect(_on_pipe_score)
		$Pipes.call_deferred("add_child",pipe)
		

func show_menu():
	$Title.show()
	$Menu.show()
	$Pipes.hide()
	$Bird.hide()
	$CurrentScoreText.hide()
	$CurrentScoreNumber.hide()


func hide_menu():
	$Title.hide()
	$Menu.hide()
	$Pipes.show()
	$Bird.show()
	$CurrentScoreText.show()
	$CurrentScoreNumber.show()


func add_pipe():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = 1300
	pipe.position.y = randi_range(380,450)
	pipe.hit.connect(_on_pipe_hit)
	pipe.score.connect(_on_pipe_score)
	$Pipes.call_deferred("add_child",pipe)

func _process(delta):
	for pipe in $Pipes.get_children():
		pipe.position.x -= 2

func _on_pipe_score():
	$PointSound.play()
	current_score += 1
	$CurrentScoreNumber.text = str(current_score)
	if current_score > high_score:
		high_score = current_score
		$HighScoreNumber.text = str(current_score)

func game_over():
	get_tree().paused = true
	$GameOverSound.play()

func _on_pipe_hit():
	game_over()

func _on_end_area_entered(area):
	if area.name == "PipeEnd":
		area.get_parent().queue_free()
		add_pipe()

func _on_top_body_entered(body):
	if body.name == "Bird":
		game_over()


func _on_bottom_body_entered(body):
	if body.name == "Bird":
		game_over()


func _on_new_game_button_pressed():
	new_game_setup()
	hide_menu()
	get_tree().paused = false

func _on_quit_game_button_pressed():
	get_tree().quit()

func _on_game_over_sound_finished():
	show_menu()

func update_high_score():
	pass 
