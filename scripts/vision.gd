extends Node2D

@onready var area_of_sight : AreaOfSight2D = $AreaOfSight2D
@onready var frozen: bool = false
@onready var som_visto: AudioStreamPlayer2D = $"../visto"
# Called when the node enters the scene tree for the first time.

func _on_area_of_sight_2d_node_entered_area(node: Node2D) -> void:
	if node.name == "Player":
		if node.has_method("respawn"):
			som_visto.play()
			node.respawn()
