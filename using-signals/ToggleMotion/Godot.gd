extends Sprite

# state variables
var speed = 400
var angular_speed = PI

# called on creation
func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "on_timer_timeout")

# called every tick
func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

# called on button press
func _on_Button_pressed():
	# turn process on/off
	set_process(not is_processing())

# called at every timeout
func on_timer_timeout():
	# toggle visibility
	visible = not visible;
