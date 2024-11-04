extends Node2D

@onready var image_texture = preload("res://Assets/healthpot.png")
const weapon_type: String = "consumable"
var value = 50
const max_count = 10
var count = 1
var can_drag: bool = false
@onready var health_potion = preload("res://Items/health_potion.tscn")

func _process(_delta: float):
	if can_drag:
		drag_item()
func drag_item():
	position = get_global_mouse_position()
func use():
	if get_parent().health >= get_parent().max_health:
		get_parent().health = get_parent().max_health
	elif get_parent().health <= get_parent().max_health:
		get_parent().health += value
		if get_parent().health >= get_parent().max_health:
			get_parent().health = get_parent().max_health
	else: 
		pass
	


func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.
