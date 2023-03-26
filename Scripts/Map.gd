extends Node

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func up_block_exited():
	print("respon first")
	$UpFloor/FirstBlock.global_position.x = get_viewport().get_visible_rect().size.x * 2
	pass # Replace with function body.


func up_second_block_exited():
	print("respon second")	
	$UpFloor/SecondBlock.global_position.x = get_viewport().get_visible_rect().size.x	
	pass # Replace with function body.
