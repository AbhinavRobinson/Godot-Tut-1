extends RigidBody2D

# Export min/max speed
export var min_speed = 150.0
export var max_speed = 250.0

func _ready():
	# randomize seed
	randomize()
	# play anim
	$AnimatedSprite.play()
	# get all mob types
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	# get random mob
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

# Destory monster when mob exits screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
