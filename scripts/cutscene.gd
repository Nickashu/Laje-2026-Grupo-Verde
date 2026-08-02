extends Node2D

@onready var animation_player = $AnimationPlayer
var play = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play = true
	animation_player.play("cinematic")
	await animation_player.animation_finished
	Transição.load_scene("res://cenas/cena_teste.tscn")
