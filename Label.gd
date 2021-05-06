extends Sprite

var ANGULAR_SPEED = PI
var SPEED = 250.0

func _process(delta):
	rotation += ANGULAR_SPEED * delta
	var velocity = Vector2.UP.rotated(rotation) * SPEED
	position += velocity * delta
