extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.is_action_pressed("close window")
	
	if input == true:
		get_tree().quit()

func _on_close_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://GameScene.tscn")
