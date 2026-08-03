extends Area2D

var player = null
var player_in_area = false

@onready var transicao = $"Transição"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":  # Verifica se o corpo que entrou é o jogador
		transicao.load_scene("res://cenas/cutscene_final.tscn")
