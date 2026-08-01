extends Area2D

var player = null
var player_in_area = false

func _ready():
	$Label.visible = false  # Esconde o label de interação no início
	
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interagir"):  # Verifica se a tecla "E" foi pressionada
		Canvas.LogPopup(4)
		player.frozen = true

	if player_in_area and Input.is_action_just_pressed("ui_cancel"): #or Input.is_action_just_pressed("click"):  # Verifica se a tecla "ESC" foi pressionada
		Canvas.HideLogPopup()
		player.frozen = false

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
		Popups.HideLogPopup()
