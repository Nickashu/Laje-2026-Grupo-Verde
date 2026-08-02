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
	path.progress += delta * speed
	if (path.progress_ratio == 1 or path.progress_ratio == 0 and path.loop == false):
		speed = -speed
		
		


func _on_timer_timeout() -> void:
	waiting = false
