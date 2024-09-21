extends CharacterBody2D
@onready var item_pickup = preload("res://bow_pickup.tscn")
@onready var main = get_node("/root/Main")
@onready var image_texture = preload("res://bow.png")
@onready var arrow = preload("res://arrow.tscn")
const weapon_type: String = "ranged"
var attack_rate: float = 1.0
func _ready():
	pass
	
func _process(_delta):
	look_at(get_global_mouse_position())
	$Sprite2D.flip_h = true
	
func fire():
	var ammo = arrow.instantiate()
	ammo.position = get_parent().position
	main.add_child(ammo)
	

func drop():
	var weapon = item_pickup.instantiate()
	print("weapon instantiated")
	weapon.position = position
	print("weapon position")
	main.add_child(weapon)
	print(weapon)
	queue_free()
