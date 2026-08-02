extends Node2D

@export_group("Configurações de Rotação")
@export var direcoes_giro: Array[Vector2] = [Vector2.DOWN, Vector2.UP]
@export var tempo_giro: float = 2.0

@onready var enemy = $Enemy
@onready var timer = $Timer

var indice_atual: int = 0

func _ready() -> void:
	if direcoes_giro.size() > 0:
		enemy.direcao_estacionaria = direcoes_giro[0]
		
	timer.wait_time = tempo_giro
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout() -> void:
	if direcoes_giro.size() > 0:
		indice_atual = (indice_atual + 1) % direcoes_giro.size()
	   
		enemy.direcao_estacionaria = direcoes_giro[indice_atual]
