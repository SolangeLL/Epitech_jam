extends Node

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UpFloor/FirstBlock.global_position = $UpFloor/FirstBlock.global_position.move_toward($UpFloor/Marker2D.global_position, delta * speed)
	$UpFloor/SecondBlock.global_position = $UpFloor/SecondBlock.global_position.move_toward($UpFloor/Marker2D.global_position, delta * speed)
	$DownFloor/FirstBlock.global_position = $DownFloor/FirstBlock.global_position.move_toward($UpFloor/Marker2D.global_position, delta * speed)
	$DownFloor/SecondBlock.global_position = $DownFloor/SecondBlock.global_position.move_toward($UpFloor/Marker2D.global_position, delta * speed)
	pass



func up_block_exited():
	print("respon first")
	$UpFloor/FirstBlock.global_position.x = get_viewport().get_visible_rect().size.x * 2
	pass # Replace with function body.


func up_second_block_exited():
	print("respon second")	
	$UpFloor/SecondBlock.global_position.x = get_viewport().get_visible_rect().size.x	
	pass # Replace with function body.
