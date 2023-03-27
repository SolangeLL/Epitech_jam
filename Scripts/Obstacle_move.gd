extends Area2D

var sounds = [preload("res://assets/sounds/hello.ogg"), preload("res://assets/sounds/activated.ogg"), preload("res://assets/sounds/alarm.ogg"), preload("res://assets/sounds/tic_tac.ogg")]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var duration = randi_range(25, 60)
	$Timer.wait_time = duration
	$Timer.start()
	$AnimatedSprite2D.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.die()


func _on_timer_timeout():
	var i = randi_range(0, 3)
	$TurretSound.stream = sounds[i]
	$TurretSound.play()
	var duration = randi_range(25, 60)
	$Timer.wait_time = duration
	pass # Replace with function body.
