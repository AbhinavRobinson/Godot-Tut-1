extends Area2D

# player is hit
signal hit

# speed of player
export var speed = 400.0

#screen size of window
var screen_size = Vector2.ZERO

func _ready():
	# get screen size
	screen_size = get_viewport_rect().size
	hide()

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
	if direction.length() > 0:
		direction = direction.normalized()
		# animate player
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	# move player
	position += direction * speed * delta
	
	# limit player to screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0 ,screen_size.y)

	# give animation direction (left/right/up/down)
	if direction.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction.x < 0
	elif direction.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = direction.y > 0

func start(new_position):
	# init player
	position = new_position
	show()
	$CollisionShape2D.disabled = false
	
func _on_Player_body_entered(body):
	# if player hit, fail state
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
