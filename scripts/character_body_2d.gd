extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	var direction := Vector2.ZERO
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1

	# Flip based on movement direction, keep last facing when idle.
	if direction.x != 0:
		animated_sprite.flip_h = direction.x < 0

	velocity.x = direction.x * SPEED
	move_and_slide()

	# Animation state — decided once, after physics is resolved.
	if not is_on_floor():
		animated_sprite.play("jump")
	elif direction.x != 0:
		animated_sprite.play("running")
	else:
		animated_sprite.play("idle")
