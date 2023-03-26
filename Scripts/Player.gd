extends CharacterBody2D

var run_speed = 350
var jump_speed = -500
var gravity = 1700

var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed("jump")
	var revert = Input.is_action_just_pressed("revert")
	
	if jump and is_on_floor():
		velocity.y = jump_speed
	if revert:
		gravity *= -1
		jump_speed *= -1
		$GravityDirection.target_position.y *= -1
		print(Vector3.UP)
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * run_speed
	move_and_slide()
	var normal = get_floor_normal()
	$Sprite2D.rotation = normal.angle()
	pass
