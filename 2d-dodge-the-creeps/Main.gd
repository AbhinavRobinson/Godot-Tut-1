extends Node

# all mobs scene
export (PackedScene) var mob_scene

func _ready():
	# randomize on start
	randomize()

func _on_MobTimer_timeout():
	# get mob spawn location
	var mob_spawn_location = $MobPath/MobSpawnLocation
	# get a random position on that spawn
	mob_spawn_location.unit_offset = randf()
	
	# add mob
	var mob = mob_scene.instance()
	add_child(mob)
	
	# set position
	mob.position = mob_spawn_location.position
	
	# set direction and rotation
	var direction = mob_spawn_location.rotation + PI / 2
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# add velocity
	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)
