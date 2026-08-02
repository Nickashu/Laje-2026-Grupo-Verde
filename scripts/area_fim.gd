extends Area2D

var player = null
var player_in_area = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Verifica se o corpo que entrou é o jogador
		Transição.load_scene("res://cenas/cutscene_final.tscn")
