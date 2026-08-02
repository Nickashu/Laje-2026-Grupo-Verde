extends Control

@onready var select = $AudioStreamPlayer2D
@onready var transicao = $"Transição"

func _on_play_pressed() -> void:
	select.play()
	transicao.load_scene("res://cenas/cutscene.tscn")

func _on_quit_pressed() -> void:
	select.play()
	get_tree().quit()
