extends Node2D

@onready var animation_player = $AnimationPlayer
var play = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play = true
	animation_player.play("cinematic_final")
	await animation_player.animation_finished
	Transição.load_scene("res://cenas/main_menu.tscn")
