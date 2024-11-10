extends Area2D

@onready var fire_staff = preload("res://Weapons/fire_staff.tscn")
var can_pickup: bool = false
var hero: Node2D = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_pickup == true:
		
		var weapon = fire_staff.instantiate()
		for i in range(len(hero.tool_bar)):
			if hero.inventory[i] != null:
				pass
			else:
				hero.inventory[i] = weapon
				queue_free()
				break
		

func _on_body_exited(body:Node2D) -> void:
	can_pickup = false
	hero = null

func _on_body_entered(body: Node2D):
	can_pickup = true
	hero = body



	
