extends Path2D

@onready var enemy = $PathFollow2D/Enemy
@onready var path = $PathFollow2D
@export var speed:= 100.0

var waiting: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if enemy.frozen:
		return
		
	ray()
	
	if waiting:
		return
		
	path.progress += delta * speed
	if (path.progress_ratio == 1 or path.progress_ratio == 0 and path.loop == false):
		speed = -speed

func ray() -> void:
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
				waiting = true
				return
	
	waiting = false
