extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Path2D/PathFollow2D/Enemy.player_spotted.connect(_on_player_spotted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_spotted() -> void:
	$Player.respawn()
