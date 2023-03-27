extends CanvasLayer



func update_death(death):
	$CurrentDeath.text = "Current: " + str(death)
	$CurrentDeath.show()

func set_best_death(best):
	$BestDeath.text = "Best: " + best
	$BestDeath.show()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
