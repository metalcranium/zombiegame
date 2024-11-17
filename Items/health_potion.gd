extends Sprite2D

@onready var main = get_node("/root/Main")
@onready var image_texture = preload("res://Assets/healthpot.png")
const weapon_type: String = "consumable"
var value = 50
const max_count = 10
var count = 1
var can_drag: bool = false
@onready var item = load("res://Items/health_potion_pickup.tscn")

func _process(_delta: float):
	
	if can_drag:
		drag_item()
func drag_item():
	position = get_parent().get_global_mouse_position()
func use():	
	if get_parent().health == get_parent().max_health:
		get_parent().remove_child(self)
		pass
	elif get_parent().health >= get_parent().max_health:
		get_parent().health = get_parent().max_health
		queue_free()
	elif get_parent().health <= get_parent().max_health:
		get_parent().health += value
		if get_parent().health >= get_parent().max_health:
			get_parent().health = get_parent().max_health
		queue_free()
	else: 
		pass
func drop():
	var hp = item.instantiate()
	print("hp is: ", hp)
	hp.position = get_global_mouse_position()
	print("position")
	main.add_child(hp)
	print("weapon dropped")
	queue_free()
func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.
