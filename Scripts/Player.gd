extends CharacterBody2D

var run_speed = 350
var jump_speed = -500
var gravity = 1700
var rotation_deg = 0

var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_pressed("jump")
	var revert = Input.is_action_just_pressed("revert")
	var debug = Input.is_action_just_pressed("debug_speeed")
	var debug2 = Input.is_action_just_pressed("debug_speed_buff")
	
	if debug:
		run_speed += 100
	if debug2:
		run_speed -= 100
	var input = Input.is_action_pressed("close window")
	
	if input == true:
		get_tree().quit()

	if jump and (is_on_floor() or is_on_ceiling()):
		velocity.y = jump_speed
	if revert:
		gravity *= -1
		jump_speed *= -1
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()
	
	# Rotate sprite according to ground normal
	var normal = get_floor_normal()
	$Sprite2D.rotation = normal.angle()
	if !is_on_floor() and !is_on_ceiling() and rotation_deg < 90:
		if $jump.playing == false:
			$jump.play()
		print(rotation_deg)
		rotation_deg += 0.15
		$Sprite2D.rotation += rotation_deg
	if is_on_floor() or is_on_ceiling():
		rotation_deg = 0
	pass

func die():
	global_position = Vector2(220,213)
