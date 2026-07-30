extends CharacterBody2D


@onready var posicao_inicial: Vector2 = global_position
@onready var animation_tree := get_node_or_null("/root/Node2D/Player/AnimationTree") as AnimationTree

var frozen
var ultima_direcao := Vector2(0, -1)

func _ready():
	frozen = false
	print(animation_tree)
	print(name)
	print(get_path())

	if animation_tree == null:
		push_error("AnimationTree não encontrado!")
		return

func respawn() -> void:
	global_position = posicao_inicial

const VELOCIDADE_MAX = 130
const ACELERACAO = 1200
const ATRITO = 1000
# aceleracao e atrito pra adicionar fluidez ao movimento

func _physics_process(delta):
	
	if frozen:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	
	var resultante = Vector2(0,0)	
	resultante.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	resultante.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# operação de subtração pra decidir a direção da resultante x e y (0, 1 ou -1)
	resultante = resultante.normalized()
	# faz com que a direcao, quando sobreposta (cima ou baixo com esquerda ou direita), nao fique mais rapido (vou deixar desativado por enquanto)
	
	if resultante != Vector2(0,0):
		
		velocity = velocity.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta)
		# faz com que a velocidade va gradualmente em direcao a velocidade maxima baseado na aceleracao 
		# (quanto maior a aceleracao, mais rapido a velocidade chega na quantidade máxima)
		# toca a animação de correndo baseado no botao que o jogador ta apertando
	
		ultima_direcao = resultante
		
		# pega as animações de correndo e parado da animation tree
		animation_tree.set("parameters/Andando/blend_position", resultante)
		animation_tree.set("parameters/Parado/blend_position", resultante)
		
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, ATRITO * delta)

	move_and_slide()
	
	if (Input.is_key_pressed(KEY_R)):
		respawn()
