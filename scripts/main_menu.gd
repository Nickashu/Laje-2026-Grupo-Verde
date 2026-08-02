extends Control

@onready var select = $AudioStreamPlayer2D

func _on_play_pressed() -> void:
	select.play()
	Transição.load_scene("res://cenas/cena_teste.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
