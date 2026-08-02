extends Path2D
@onready var enemy = $PathFollow2D/Enemy
@onready var path = $PathFollow2D
@export var speed:= 1.0


var indo:= true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !enemy.frozen:
		path.progress_ratio += delta * speed
		if (path.progress_ratio == 1 or path.progress_ratio == 0 and path.loop == false):
			speed = -speed
			#enemy.area_of_sight.rotate(PI/2)
			
