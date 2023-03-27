extends CanvasLayer

var countdown = 5;
signal new_game

func set_timer_text(text):
	$Counter.text = text

func set_win_text(death):
	$WinText.text = "You won ! You only died " + death + " times.
Ready for another game ?"

func set_cheat_text():
	$WinText.text = "Great, you find how to glitch life!"
	
func start_countdown():
	$Timer.start()
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	countdown -= 1
	if countdown == 0:
		$Timer.stop()
		set_timer_text(str(5))
		emit_signal("new_game")
	set_timer_text(str(countdown))
	pass # Replace with function body.
