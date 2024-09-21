extends Node2D

@onready var fire_ball = preload("res://fire_ball.tscn")
@onready var main = get_node("/root/Main")
@onready var image_texture = preload("res://firestaff.png")
const is_consumable: bool = false
const mana_cost = 5
const weapon_type: String = "ranged"
var attack_rate:float = 0.5

func fire():
	if get_parent().mana >= mana_cost:
		if get_parent().level <= 4:
			fire_ball_1()
		else: 
			fire_ball_2()
			
func fire_ball_1():
	var flame = fire_ball.instantiate()
	flame.position = get_parent().position
	main.add_child(flame)
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
	
