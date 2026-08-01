class_name CameraLivre2D
extends Camera2D


@export var player: Jogador

@export var velocidade_camera := 300.0
@export var velocidade_volta := 6.0

# Distância da borda que ativa o movimento.
@export var distancia_borda := 120.0

# Limite de afastamento da câmera.
@export var distancia_maxima := 1000.0


var modo_camera := false
var voltando := false


func _ready() -> void:

	enabled = true
	make_current()

	position_smoothing_enabled = false

	offset = Vector2.ZERO

	if player == null:

		push_error(
			"O Player não foi colocado no campo Player da Camera2D2."
		)

		return

	global_position = player.global_position

	print("Câmera atual: ", is_current())


func _process(delta: float) -> void:

	if player == null:
		return

	# O nó da câmera acompanha a posição do jogador.
	# O movimento independente é realizado pelo offset.
	global_position = player.global_position

	if modo_camera:

		mover_camera_pelas_bordas(delta)

	elif voltando:

		offset = offset.lerp(
			Vector2.ZERO,
			clampf(velocidade_volta * delta, 0.0, 1.0)
		)

		if offset.length() < 1.0:

			offset = Vector2.ZERO
			voltando = false

	force_update_scroll()


func mover_camera_pelas_bordas(delta: float) -> void:

	var viewport := get_viewport()

	var mouse_pos := viewport.get_mouse_position()
	var tamanho_tela := viewport.get_visible_rect().size

	var direcao := Vector2.ZERO


	# Borda esquerda.
	if mouse_pos.x <= distancia_borda:
		direcao.x = -1.0

	# Borda direita.
	elif mouse_pos.x >= tamanho_tela.x - distancia_borda:
		direcao.x = 1.0


	# Borda superior.
	if mouse_pos.y <= distancia_borda:
		direcao.y = -1.0

	# Borda inferior.
	elif mouse_pos.y >= tamanho_tela.y - distancia_borda:
		direcao.y = 1.0


	if direcao == Vector2.ZERO:
		return

	direcao = direcao.normalized()

	offset += direcao * velocidade_camera * delta

	offset.x = clampf(
		offset.x,
		-distancia_maxima,
		distancia_maxima
	)

	offset.y = clampf(
		offset.y,
		-distancia_maxima,
		distancia_maxima
	)


func ativar_modo_livre() -> void:

	modo_camera = true
	voltando = false

	print("Modo livre da câmera ativado.")


func voltar_para_player() -> void:

	modo_camera = false
	voltando = true

	print("Câmera voltando para o jogador.")
