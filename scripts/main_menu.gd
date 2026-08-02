extends Control

func _on_play_pressed() -> void:
	Transição.load_scene("res://cenas/cutscene.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
