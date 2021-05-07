extends Area2D

# speed of player
export var speed = 400.0

#screen size of window
var screen_size = Vector2.ZERO

func _ready():
	# get screen size
	screen_size = get_viewport_rect().size

func _process(delta):
	# default to no motion
	var direction = Vector2.ZERO
	
	# get player input X
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	# get player input Y
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	# if more than one key is pressed, this will normalize it to magnitude 1.0
	if direction.length() > 1:
		direction = direction.normalized()
	
	# move player
	position += direction * speed * delta
	
	# limit player to screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0 ,screen_size.y)
