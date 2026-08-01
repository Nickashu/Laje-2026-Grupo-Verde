extends Sprite2D

var open = false

func _physics_process(delta: float) -> void:
	if(get_parent().alavanca_1 == true):
		if(open == false):
			open_door()
		else:
			print("a")


func open_door():
	frame = 3
	#%DoorCollision.set_deferred("disabled",true)
	open = true
	print("abriu")

func close_door():
	frame = 0
	#%DoorCollision.set_deferred("disabled",false)
