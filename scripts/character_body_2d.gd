class_name Jogador
extends CharacterBody2D


@onready var posicao_inicial: Vector2 = global_position

@onready var animation_tree: AnimationTree = \
	get_node_or_null("AnimationTree") as AnimationTree


const VELOCIDADE_MAX := 130.0
const ACELERACAO := 1200.0
const ATRITO := 1000.0


var frozen
var ultima_direcao := Vector2.UP


func _ready() -> void:
	frozen = false

	if animation_tree == null:
		push_error(
			"O AnimationTree não foi encontrado dentro do Player."
		)


func travar_personagem(valor: bool) -> void:

	frozen = valor

	if frozen:
		velocity = Vector2.ZERO


func respawn() -> void:

	global_position = posicao_inicial
	velocity = Vector2.ZERO


func _physics_process(delta: float) -> void:

	if Input.is_key_pressed(KEY_R):
		respawn()

	if frozen:

		velocity = Vector2.ZERO

		if animation_tree:
			animation_tree.active = false

		move_and_slide()
		return

	if animation_tree:
		animation_tree.active = true

	mover(delta)


func mover(delta: float) -> void:

	var direcao := Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	if direcao != Vector2.ZERO:

		velocity = velocity.move_toward(
			direcao * VELOCIDADE_MAX,
			ACELERACAO * delta
		)

		ultima_direcao = direcao

		if animation_tree:

			animation_tree.set(
				"parameters/Andando/blend_position",
				direcao
			)

			animation_tree.set(
				"parameters/Parado/blend_position",
				direcao
			)

	else:

		velocity = velocity.move_toward(
			Vector2.ZERO,
			ATRITO * delta
		)

		if animation_tree:

			animation_tree.set(
				"parameters/Parado/blend_position",
				ultima_direcao
			)

	move_and_slide()
