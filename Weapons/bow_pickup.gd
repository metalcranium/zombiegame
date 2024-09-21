extends Area2D
@onready var boww = preload("res://Weapons/bow.tscn")

func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("interact"):
		var bow = boww.instantiate()
		bow.position = body.position
		body.add_child(bow)
		for i in range(len(body.tool_bar)):
			if body.tool_bar[i] != null:
				pass
			else:
				body.tool_bar[i] = bow
				break
		queue_free()
