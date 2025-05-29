extends CharacterBody2D

const SPEED = 100
const JUMP_VELOCITY = -350

@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	var platform_velocity = Vector2.ZERO

# detect collision with the platform pls work
	var collision = get_last_slide_collision()
	if collision and collision.get_collider().is_in_group("moving_platform") and collision.get_normal().y < -0.7:
		platform_velocity = collision.get_collider().get_velocity()

# movement
	move_and_slide()

# apply platform movement
	global_position += platform_velocity * delta


	# reset player if fall to hell
	if global_position.y > 500:
		global_position = Vector2(0, 0)
		velocity = Vector2.ZERO


	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY

	velocity.y += 1000 * delta  # gravity
	move_and_slide()

	# flip the sprite if wrong
	if direction != 0:
		sprite.flip_h = direction < 0

	# Animation handling
	if !is_on_floor():
		sprite.play("jump")
	elif direction != 0:
		sprite.play("run")
	else:
		sprite.play("idle")
