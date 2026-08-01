extends Sprite2D

var open = false

func _physics_process(delta: float) -> void:
	if(get_parent().alavanca_preta == true):
		if(open == false):
			open_door()
		else:
			return

func open_door():
	frame = 3
	%DoorCollisionPreta.set_deferred("disabled",true)
	open = true

func close_door():
	frame = 0
	%DoorCollisionPreta.set_deferred("disabled",false)
