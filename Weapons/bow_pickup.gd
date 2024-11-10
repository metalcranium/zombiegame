extends Area2D
@onready var bow = preload("res://Weapons/bow.tscn")
var can_pickup: bool = false
var hero: Node2D = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_pickup == true:
		var boww = bow.instantiate()
		for i in hero.inventory.size():
			if hero.inventory[i] != null:
				pass
			else:
				hero.inventory[i] = boww
				queue_free()
				break

func _on_body_entered(body: Node2D) -> void:
	can_pickup = true
	hero = body


func _on_body_exited(body: Node2D) -> void:
	can_pickup = false
	hero = null
