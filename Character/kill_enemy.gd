extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.health -= get_parent().damage
