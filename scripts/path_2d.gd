extends Path2D
@onready var enemy = $PathFollow2D/Enemy
@onready var path = $PathFollow2D
@onready var timer:= $PathFollow2D/Timer
@export var speed:= 100.0
var waiting: bool = false


var indo:= true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enemy.frozen or waiting:
		return
	ray()
	
	if waiting:
		return
		
	path.progress += delta * speed
	if (path.progress_ratio == 1 or path.progress_ratio == 0 and path.loop == false):
		speed = -speed
		
		

func ray() -> void:
	var space_state = get_world_2d().direct_space_state
	var destino = enemy.global_position + (enemy.look_direction * 40)
	var query = PhysicsRayQueryParameters2D.create(enemy.global_position, destino, 101)
	query.collide_with_areas = true
	var result = space_state.intersect_ray(query)
	if result:
		timer.start()
		waiting = true
		return

func _on_timer_timeout() -> void:
	waiting = false
