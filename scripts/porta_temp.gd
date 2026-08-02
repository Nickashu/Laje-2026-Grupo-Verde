class_name Porta_temp

extends Area2D


@onready var sprite: Sprite2D = $Sprite2D

@onready var colisao_fisica: CollisionShape2D = \
	$StaticBody2D/CollisionShape2D

@onready var timer: Timer = $Timer


@export var filtro: FiltroInteracao

@export var tempo_fechada := 5.0


var aberta := true
var esperando := false


func _ready() -> void:

	# Permite que o Area2D receba cliques.
	input_pickable = true

	# O Area2D precisa estar em alguma Collision Layer.
	if collision_layer == 0:
		collision_layer = 1

	timer.one_shot = true
	timer.wait_time = tempo_fechada

	# Conecta o Timer pelo código.
	if not timer.timeout.is_connected(_on_timer_timeout):
		timer.timeout.connect(_on_timer_timeout)

	if filtro == null:

		push_error(
			"O filtro não foi colocado na porta temporária."
		)

	abrir()


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

	print("Clique na porta temporária.")

	if filtro == null:
		return

	if not filtro.modo_filtro:

		print("O modo filtro está desligado.")
		return

	if esperando:

		print("A porta está esperando o Timer.")
		return

	if aberta:
		fechar()


func abrir(tocar_som := true) -> void:

	aberta = true
	esperando = false

	# Desativa somente a colisão que bloqueia o jogador.
	colisao_fisica.set_deferred(
		"disabled",
		true
	)
	if tocar_som:
		$"../sons/porta_abrindo".play()


func fechar() -> void:

	aberta = false
	esperando = true

	# Ativa a colisão que bloqueia o jogador.
	colisao_fisica.set_deferred(
		"disabled",
		false
	)
	$"../sons/porta_fechando".play()

	timer.start()


func _on_timer_timeout() -> void:

	abrir()
