extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	pass # Replace with function body.

func _on_Turret_body_entered(body):
	if body.is_in_group("Player"):
		body.die()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
