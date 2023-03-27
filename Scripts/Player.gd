extends CharacterBody2D

var run_speed = 350
var jump_speed = -700
var gravity = 1700
var rotation_deg = 0
var nb_death = 0;

var jumping = false
var can_die = true

func get_nb_death():
	return nb_death

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_pressed("jump")
	var revert = Input.is_action_just_pressed("revert")
	var debug = Input.is_action_just_pressed("debug_speeed")
	var debug2 = Input.is_action_just_pressed("debug_speed_buff")
	var god = Input.is_action_just_pressed("god_mode")
	
	if debug:
		run_speed += 100
	if debug2:
		run_speed -= 100
	var input = Input.is_action_pressed("close window")
	
	if god:
		can_die = !can_die
	
	if input == true:
		get_tree().quit()

	if jump and (is_on_floor() or is_on_ceiling()):
		$Jump.play()
		velocity.y = jump_speed
	if revert:
		$SwitchGravitySound.play()
		gravity *= -1
		jump_speed *= -1
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _ready():
	$WinHUD.hide()
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()
	
	# Rotate sprite according to ground normal
	var normal = get_floor_normal()
	$Sprite2D.rotation = normal.angle()		
	
	# Rotate in midair
	if !is_on_floor() and !is_on_ceiling() and rotation_deg < 90:
		rotation_deg += 0.15
		$Sprite2D.rotation += rotation_deg
	if is_on_floor() or is_on_ceiling():
		rotation_deg = 0

func die():
	if can_die:
		$DieSound.play()
		global_position = Vector2(220,213)
		nb_death += 1
		$ScoreHUD.update_death(str(nb_death))

func win():
	$WinHUD.set_win_text(str(nb_death))
	$WinHUD.show()
	$WinHUD.start_countdown()

func cheat():
	$WinHUD.set_cheat_text()
	$WinHUD.show()
	$WinHUD.start_countdown()

func _on_win_hud_new_game():
	can_die = true
	die()
	$WinHUD.hide()
	nb_death = 0
