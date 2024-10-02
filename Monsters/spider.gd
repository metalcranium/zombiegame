extends CharacterBody2D

var max_health: int = 10
var health: int = max_health
var speed: int = 100
@onready var hero = get_node("/root/Main/Hero")
var target: Node2D = null
func _ready():
	#target = get_parent().target
	target = hero
	print("spider")
func _physics_process(_delta: float) -> void:
	if target != null:
		velocity = position.direction_to(target.position).normalized() * speed
	else:
		pass
	move_and_slide()



func _on_area_2d_body_entered(_body:Node2D) -> void:
	print("spider hit you")
	print(target)
