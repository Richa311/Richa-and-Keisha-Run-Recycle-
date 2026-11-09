extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		



	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("default")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("default")

	# Flip the sprite artwork left/right based on movement
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	# handle the trash pickup
	if event.is_action_pressed("Press_red"):
		EventBus.trash_collected.emit(0)
	elif event.is_action_pressed("Press_yellow"):
		EventBus.trash_collected.emit(1)
	elif event.is_action_pressed("Press_green"):
		EventBus.trash_collected.emit(2)
		
