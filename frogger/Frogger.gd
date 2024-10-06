extends Area2D


@export var tile_size = 32
@export var animation_speed = 3
var moving = false
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			rotate_toward_dir(dir)
			move(dir)

func rotate_toward_dir(dir):
	var direction = inputs[dir]
	if direction.x != 0:
		rotation_degrees = 90 * direction.x
	else:
		rotation_degrees = max(0, 180 * direction.y)
	print("Rotation: " + str(rotation_degrees))


func move(dir):
	var tween = create_tween()
	tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
	moving = true
	await tween.finished
	moving = false
