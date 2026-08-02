extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var transicao = $"Transição"

var play = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play = true
	animation_player.play("intro")
	await animation_player.animation_finished
	transicao.load_scene("res://cenas/cena_teste.tscn")
