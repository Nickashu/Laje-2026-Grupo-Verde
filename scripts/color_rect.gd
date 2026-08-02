class_name FiltroInteracao
extends ColorRect


@export var player: Jogador
@export var camera: CameraLivre2D


var modo_filtro := false


const CURSOR_MIRA = preload(
	"res://assets/mouse_twenk.png"
)


func _ready() -> void:

	modo_filtro = false
	visible = false

	# Impede que a tela verde bloqueie os cliques nas portas.
	mouse_filter = Control.MOUSE_FILTER_IGNORE

	Input.set_custom_mouse_cursor(null)

	if player == null:

		push_error(
			"O Player não foi colocado no campo Player do filtro."
		)

	else:

		player.travar_personagem(false)


	if camera == null:

		push_error(
			"A Camera2D2 não foi colocada no campo Camera do filtro."
		)

	else:

		camera.modo_camera = false


func _input(event: InputEvent) -> void:

	if event.is_action_pressed("troca_de_modo"):
		$"../../sons/troca_de_modo".play()
		alternar_filtro()


func alternar_filtro() -> void:

	modo_filtro = !modo_filtro
	visible = modo_filtro

	if modo_filtro:
		ativar_filtro()
	else:
		desativar_filtro()

	print("Modo filtro: ", modo_filtro)


func ativar_filtro() -> void:

	Input.set_custom_mouse_cursor(
		CURSOR_MIRA,
		Input.CURSOR_ARROW,
		Vector2(16, 16)
	)

	if player:
		player.travar_personagem(true)

	if camera:
		camera.ativar_modo_livre()


func desativar_filtro() -> void:

	Input.set_custom_mouse_cursor(null)

	if player:
		player.travar_personagem(false)

	if camera:
		camera.voltar_para_player()


func _exit_tree() -> void:

	Input.set_custom_mouse_cursor(null)
