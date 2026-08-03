extends Area2D

var player = null
var player_in_area = false
var alavanca_roxa

@onready var anim = $AnimationPlayer

func _ready():
	alavanca_roxa = false
	$Label.visible = false  # Esconde o label de interação no início
	
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interagir"):  # Verifica se a tecla "E" foi pressionada
		$"../sons/alavanca".play()
		alavanca_roxa = true
		anim.play("lula")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Verifica se o corpo que entrou é o jogador
		player_in_area = true
		player = body
		$Label.visible = true  # Mostra o label de interação


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		player = body
		$Label.visible = false  # Esconde o label de interação
