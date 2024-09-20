extends Area2D

@onready var fire_staff = preload("res://fire_staff.tscn")

func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("interact"):
		var weapon = fire_staff.instantiate()
		body.add_child(weapon)
		for i in range(len(body.tool_bar)):
			if body.tool_bar[i] != null:
				pass
			else:
				body.tool_bar[i] = weapon
				break
		queue_free()
