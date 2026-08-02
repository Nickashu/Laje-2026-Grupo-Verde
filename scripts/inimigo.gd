extends CharacterBody2D

@onready var frozen: bool = false
@onready var initial_position: Vector2 = global_position
@onready var last_position: Vector2 = global_position
@onready var animation_tree: AnimationTree = \
	get_node_or_null("AnimationTree") as AnimationTree
@onready var vision:= $vision
@export var deggre:= 0

func _ready() -> void:
	check_animation_tree()
	vision.rotate(deg_to_rad(deggre))
	notify_property_list_changed()

func _physics_process(delta: float) -> void:
	if !frozen:
		animation_tree.active = true
		var current_position: Vector2 = global_position
		velocity = current_position - last_position
	else:
		animation_tree.active = false
		
func check_animation_tree() ->void:
	if animation_tree == null:
		push_error(
			"O AnimationTree não foi encontrado dentro do Player."
		)
