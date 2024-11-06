extends Area2D

@onready var health_potion = load("res://Items/health_potion.tscn")
var can_pickup: bool = false
var hero: Node2D = null

func _process(_delta: float) -> void:
	if Input.is_action_pressed("interact") and can_pickup == true:
		var hp = health_potion.instantiate()
		for i in hero.inventory.size():
			if hero.inventory[i] != null:
				pass
			else:
				hero.inventory[i] = hp
				queue_free()
				
				break
		



func _on_body_exited(_body:Node2D) -> void:
	can_pickup = false
	hero = null





func _on_body_entered(body: Node2D) -> void:
	can_pickup = true
	hero = body
			
