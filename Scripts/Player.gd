extends KinematicBody2D

var run_speed = 350
var jump_speed = -300
var gravity = 1700

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed("ui_select")
	
	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
		gravity *= -1
		jump_speed *= -1
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, 1))
	pass
