extends Area2D


@onready var sprite: Sprite2D = $Sprite2D

@onready var colisao_fisica: CollisionShape2D = \
	$StaticBody2D/CollisionShape2D


@export var filtro: FiltroInteracao

@export var porta_aberta: Texture2D
@export var porta_fechada: Texture2D

# Define se a porta começa aberta quando a cena é carregada.
@export var comeca_aberta := true


var aberta := true


func _ready() -> void:

	# Permite que o Area2D receba cliques.
	input_pickable = true

	# O Area2D precisa estar em alguma Collision Layer.
	if collision_layer == 0:
		collision_layer = 1

	if filtro == null:

		push_error(
			"O filtro não foi colocado na porta permanente."
		)

	aberta = comeca_aberta
	atualizar_porta()


func _input_event(
	_viewport: Viewport,
	event: InputEvent,
	_shape_idx: int
) -> void:

	if not event is InputEventMouseButton:
		return

	var clique := event as InputEventMouseButton

	if clique.button_index != MOUSE_BUTTON_LEFT:
		return

	if not clique.pressed:
		return

	print("Clique na porta permanente.")

	if filtro == null:
		return

	if not filtro.modo_filtro:

		print("O modo filtro está desligado.")
		return

	aberta = not aberta
	if aberta:
		$"../sons/porta_abrindo".play()
	else:
		$"../sons/porta_fechando".play()

	atualizar_porta()


func atualizar_porta() -> void:

	if aberta:

		sprite.texture = porta_aberta

		colisao_fisica.set_deferred(
			"disabled",
			true
		)

	else:

		sprite.texture = porta_fechada

		colisao_fisica.set_deferred(
			"disabled",
			false
		)
