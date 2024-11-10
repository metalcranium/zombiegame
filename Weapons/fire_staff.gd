extends Sprite2D

@onready var fire_ball = preload("res://Weapons/fire_ball.tscn")
@onready var main = get_node("/root/Main")
@onready var image_texture = preload("res://Assets/firestaff.png")
@onready var weapon_drop = load("res://Weapons/fire_staff_pickup.tscn")
const is_consumable: bool = false
const mana_cost = 5
const weapon_type: String = "ranged"
var attack_rate:float = 0.5
var parent: Node2D
var can_drag: bool = false

func _ready():
	parent = get_parent()
	print(parent)
func _process(delta: float) -> void:
	if can_drag:
		drag_item()
func fire():
	if get_parent().mana >= mana_cost:
		fire_ball_1()
			
func fire_ball_1():
	var flame = fire_ball.instantiate()
	flame.position = get_parent().position
	main.add_child(flame)
	print("fire")
	get_parent().mana -= mana_cost
func fire_ball_2():
	var new_attack_rate: float = 0.25

	for shots in range(3):
		var flame = fire_ball.instantiate()
		flame.position = get_parent().position
		main.add_child(flame)
		get_parent().timer.start(new_attack_rate)
		
	get_parent().mana -= mana_cost
	get_parent().timer.start(attack_rate)

func drop():
	var staff = weapon_drop.instantiate()
	print(staff)
	staff.position = get_parent().position
	print("position")
	main.add_child(staff)
	print("weapon dropped")
func drag_item():
	position = get_global_mouse_position()
	
