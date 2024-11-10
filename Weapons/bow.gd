extends Sprite2D
@onready var item_pickup = load("res://Weapons/bow_pickup.tscn")
@onready var main = get_node("/root/Main")
@onready var image_texture = preload("res://Assets/bow.png")
@onready var arrow = preload("res://Weapons/arrow.tscn")
@onready var arrow_blast = preload("res://Weapons/arrow_blast.tscn")
const weapon_type: String = "ranged"
var attack_rate: float = 1.0
var can_drag: bool = false
var parent = get_parent()
func _ready():
	pass
	
func _process(_delta):
	#look_at(get_global_mouse_position())
	#$Sprite2D.flip_h = true
	if can_drag:
		drag_item()
	
func fire():
	var ammo = arrow_blast.instantiate()
	ammo.position = get_parent().position
	main.add_child(ammo)
	
func drag_item():
	position = get_global_mouse_position()
func drop():
	var weapon = item_pickup.instantiate()
	print("weapon instantiated")
	weapon.position = get_global_mouse_position()
	print("weapon position")
	main.add_child(weapon)
	print(weapon)
	queue_free()
