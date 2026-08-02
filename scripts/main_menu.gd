extends Control

@onready var select = $AudioStreamPlayer2D
@onready var transicao = $"Transição"

func _on_play_pressed() -> void:
	select.play()
	transicao.load_scene("res://cenas/cena_teste.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
