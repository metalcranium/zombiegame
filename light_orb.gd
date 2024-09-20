extends Area2D

var value = 5



func _on_body_entered(body: Node2D) -> void:
	body.corruption -= value
	body.mana += 3
	if body.corruption < 0:
		body.corruption = 0
	queue_free()
