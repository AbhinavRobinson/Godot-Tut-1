extends Sprite

var ANGULAR_SPEED = PI
var SPEED = 250.0

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		direction = 1

	rotation += ANGULAR_SPEED * direction * delta

	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * SPEED
	position += velocity * delta
