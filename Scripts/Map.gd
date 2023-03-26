extends Node

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UpFloor.global_position = $UpFloor.global_position.move_toward($UpFloor/Marker2D.global_position, delta * speed)
	$DownFloor.global_position = $DownFloor.global_position.move_toward($UpFloor/Marker2D.global_position, delta * speed)
	pass



func up_block_exited():
	$UpFloor/FirstBlock.global_position.x = get_viewport().get_visible_rect().size.x
	pass # Replace with function body.


func up_second_block_exited():
	$UpFloor/SecondBlock.global_position.x = get_viewport().get_visible_rect().size.x	
	pass # Replace with function body.
