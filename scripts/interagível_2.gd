extends Area2D

@onready var logs:= $"../logs"
var player = null
var player_in_area = false
@onready var anim : Animation = $AnimationPlayer.get_animation("ativar")

func _ready():
	$Label.visible = false  # Esconde o label de interação no início
	anim.loop_mode = (Animation.LOOP_LINEAR)
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interagir"):  # Verifica se a tecla "E" foi pressionada
		Canvas.LogPopup(2)
		logs.play()
		player.frozen = true

	if player_in_area and Input.is_action_just_pressed("ui_cancel"): #or Input.is_action_just_pressed("click"):  # Verifica se a tecla "ESC" foi pressionada
		Canvas.HideLogPopup()
		logs.play()
		player.frozen = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Verifica se o corpo que entrou é o jogador
		player_in_area = true
		player = body
		$Label.visible = true  # Mostra o label de interação


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		player = null
		$Label.visible = false  # Esconde o label de interação
		Popups.HideLogPopup()
