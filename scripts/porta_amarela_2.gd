extends Sprite2D

var open = false

func _physics_process(delta: float) -> void:
	if(get_parent().alavanca_amarela == true):
		if(open == false):
			open_door()
		else:
			return


func open_door():
	frame = 3
	%DoorCollisionAmarela2.set_deferred("disabled",true)
	open = true

func close_door():
	frame = 0
	%DoorCollisionAmarela2.set_deferred("disabled",false)
