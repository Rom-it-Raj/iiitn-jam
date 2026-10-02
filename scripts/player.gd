extends CharacterBody3D

@export var max_speed: float = 12.0
@export var acceleration: float = 8.0
@export var deceleration: float = 6.0
@export var turn_speed: float = 3.0
@export var turn_smooth_accel: float = 1.0
@export var turn_smooth_deccel: float = 1.0

@onready var tank: Node3D = $GameJamTank1
@onready var camera: Camera3D = $GameJamTank1/Camera3D


var current_rot: float = 0.0

var current_speed: float = 0.0

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	var turret = tank.find_child("exit_005")
	camera.reparent(turret, true)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
			
	var turn_input = Input.get_axis("ui_right", "ui_left")
	var turn_smooth = turn_smooth_accel if is_zero_approx(turn_input) else turn_smooth_deccel
	current_rot = move_toward(current_rot, turn_input, turn_smooth)
	
	if current_rot != 0.0:
		rotate_y(current_rot * turn_speed * delta)

	var throttle = 0.0
	if Input.is_action_pressed("ui_up"):
		throttle += 1.0
	if Input.is_action_pressed("ui_down"):
		throttle -= 1.0

	if throttle != 0.0:
		current_speed = move_toward(current_speed, throttle * max_speed, acceleration * delta)
	else:
		current_speed = move_toward(current_speed, 0.0, deceleration * delta)

	var forward_dir = -transform.basis.z
	velocity.x = forward_dir.x * current_speed
	velocity.z = forward_dir.z * current_speed

	# 5. Move the vehicle
	move_and_slide()
