extends Node2D

@onready var area_of_sight : AreaOfSight2D = $AreaOfSight2D
@onready var frozen: bool = false
# Called when the node enters the scene tree for the first time.

func _on_area_of_sight_2d_node_entered_area(node: Node2D) -> void:
	if node.name == "Player":
		print("Imposter spotted")
		
		area_of_sight.reset_detection()
		
		if node.has_method("respawn"):
			node.respawn()
