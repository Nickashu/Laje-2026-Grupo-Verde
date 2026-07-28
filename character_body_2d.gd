extends CharacterBody2D

var velocidade = Vector2(0,0) #velocidade normal no plano cartesiano é zero
@export var frozen = false

const VELOCIDADE_MAX = 2
const ACELERACAO = 15
const ATRITO = 10
# aceleracao e atrito pra adicionar fluidez ao movimento

func _physics_process(delta):
	if frozen:
		return
	
	var resultante = Vector2(0,0)	
	resultante.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	resultante.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# operação de subtração pra decidir a direção da resultante x e y (0, 1 ou -1)
	resultante = resultante.normalized()
	# faz com que a direcao, quando sobreposta (cima ou baixo com esquerda ou direita), nao fique mais rapido
	
	if resultante != Vector2(0,0):
		
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta)
		# faz com que a velocidade va gradualmente em direcao a velocidade maxima baseado na aceleracao 
		# (quanto maior a aceleracao, mais rapido a velocidade chega na quantidade máxima)
		
	else: 
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)

	move_and_collide(velocidade)
