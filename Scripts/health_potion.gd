extends Node2D

@onready var image_texture = preload("res://healthpot.png")
const weapon_type: String = "consumable"
var value = 25
const max_count = 10
var count = 1

func use():
	if get_parent().health >= get_parent().max_health:
		get_parent().health = get_parent().max_health
	elif get_parent().health <= get_parent().max_health:
		get_parent().health += value
		if get_parent().health >= get_parent().max_health:
			get_parent().health = get_parent().max_health
	else: 
		pass
	
