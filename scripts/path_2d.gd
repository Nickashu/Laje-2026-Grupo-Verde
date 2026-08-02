extends Path2D

@export var base_speed:= 100.0

var patrulheiros: Array[Dictionary] = []

func _ready() -> void:
	for child in get_children():
		if child is PathFollow2D:
			var inimigo_node = child.get_node_or_null("Enemy")
			if inimigo_node != null:
				patrulheiros.append({
					"path": child,
					"enemy": inimigo_node,
					"speed": base_speed,
					"waiting": false
				})

func _process(delta: float) -> void:
	for patrulheiro in patrulheiros:
		_processar_individual(patrulheiro, delta)

func _processar_individual(dados: Dictionary, delta: float) -> void:
	var enemy = dados["enemy"]
	var path = dados["path"]
	
	if enemy.frozen:
		return
		
	dados["waiting"] = checar_raio(enemy)
	
	if dados["waiting"]:
		return
		
	path.progress += delta * dados["speed"]
	
	if path.progress_ratio >= 1.0 or (path.progress_ratio <= 0.0 and path.loop == false):
		dados["speed"] = -dados["speed"]

func checar_raio(enemy: Node2D) -> bool:
	var space_state:= get_world_2d().direct_space_state
	var destino: Vector2 = enemy.global_position + (enemy.look_direction * 20)
	
	var query:= PhysicsRayQueryParameters2D.create(enemy.global_position, destino, 0b1100)
	query.collide_with_areas = true
	query.exclude = [enemy.get_rid()]
	
	var result:= space_state.intersect_ray(query)
	
	if result:
		var porta = result.collider as Porta_temp
		if porta != null:
			if porta.colisao_fisica.disabled == false:
				return true
				
	return false
