extends CharacterBody2D

var max_health: int = 30
var health: int = max_health
var speed: int = 50
var current_speed: int = speed
var xp_value: int = 15
var target: Node2D = null
var can_attack: bool = false
var damage: int = 5
@onready var spider = preload("res://Monsters/spider.tscn")
@onready var spawner = preload("res://Monsters/spider_spawner.tscn")
@onready var main = get_node("/root/Main")

func _ready():
	pass
func _physics_process(delta: float) -> void:
	if target != null:
		velocity = position.direction_to(target.position) * current_speed
	else:
		pass

	move_and_slide()


func _on_area_2d_body_exited(body:Node2D) -> void:
	current_speed = speed

func _on_area_2d_body_entered(body:Node2D) -> void:
	target = body
	var spawn = spawner.instantiate()
	spawn.position = position
	spawn.target = target
	main.add_child(spawn)
	current_speed = 0
