extends StaticBody2D

@export var move_distance: float = 200
@export var move_speed: float = 100
@export var is_vertical: bool = false

var start_position: Vector2
var direction := 1
var velocity := Vector2.ZERO
var last_position := Vector2.ZERO

func _ready():
	start_position = global_position
	last_position = global_position

func _physics_process(delta):
	# move the platform manual
	var offset = direction * move_speed * delta

	if is_vertical:
		global_position.y += offset
	else:
		global_position.x += offset

	# change direction at limit
	if global_position.distance_to(start_position) >= move_distance:
		direction *= -1

	# calculated velocity
	velocity = (global_position - last_position) / delta
	last_position = global_position

func get_velocity() -> Vector2:
	return velocity
