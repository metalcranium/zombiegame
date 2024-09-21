extends Area2D

@onready var health_potion = preload("res://Items/health_potion.tscn")

func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("interact"):
		var hp = health_potion.instantiate()
		body.add_child(hp)
		for i in range(len(body.tool_bar)):
			if body.tool_bar[i] != null:
				pass
			else:
				body.tool_bar[i] = hp
				queue_free()
				break
	
			
