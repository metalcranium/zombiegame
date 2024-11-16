extends Area2D

var value = 5
var xp_value:int 



func _on_body_entered(body: Node2D) -> void:
	body.corruption -= value
	body.mana += 3
	#body.xp += xp_value
	if body.corruption < 0:
		body.corruption = 0
	queue_free()
