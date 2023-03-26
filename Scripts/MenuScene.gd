extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.$soundtrack
func _process(delta):
	var input = Input.is_action_pressed("close window")
	if $soundtrack.playing == false:
		$soundtrack.play()
	
	if input == true:
		get_tree().quit()

func _on_close_pressed():
	$hit.play()
	await get_tree().create_timer(0.6).timeout
	get_tree().quit()


func _on_start_pressed():
	$hit.play()
	await get_tree().create_timer(0.6).timeout
	get_tree().change_scene_to_file("res://GameScene.tscn")
