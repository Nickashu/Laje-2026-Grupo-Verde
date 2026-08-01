extends CharacterBody2D

@onready var frozen: bool = false
@onready var initial_position: Vector2 = global_position
@onready var last_position: Vector2 = global_position
@onready var animation_tree:= $AnimationTree

func _physics_process(delta: float) -> void:
	if !frozen:
		animation_tree.active = true
		animation_tree.set("parameters/Andando/blend_position", velocity.normalized())
		animation_tree.set("parameters/Parado/blend_position", velocity.normalized())
	else:
		animation_tree.active = false
