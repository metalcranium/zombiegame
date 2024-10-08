extends CharacterBody2D

var max_health: int = 30
var health: int = max_health
var speed: int = 50
var current_speed: int = speed
var xp_value: int = 15
var target: Node2D = null
var can_attack: bool = false
var damage: int = 5
@onready var spider_spawner = [$SpiderSpawner1, $SpiderSpawner2, $SpiderSpawner3, $SpiderSpawner4, $SpiderSpawner5]
@onready var spider = preload("res://Monsters/spider.tscn")
@onready var spawner = preload("res://Monsters/spider_spawner.tscn")
@onready var main = get_node("/root/Main")

func _ready():
	pass
func _physics_process(_delta: float) -> void:
	if target != null:
		velocity = position.direction_to(target.position) * current_speed
	else:
		pass

	move_and_slide()


func _on_area_2d_body_exited(_body:Node2D) -> void:
	current_speed = speed

func _on_area_2d_body_entered(body:Node2D) -> void:
	target = body
	var spawn1 = spider.instantiate()
	spawn1.position = spider_spawner[0].position
	spawn1.target = target
	main.add_child(spawn1)
	# var spawn2 = spawner.instantiate()
	# spawn2.position = $SpiderSpawner2.position
	# spawn2.target = target
	# main.add_child(spawn2)
	# var spawn3 = spawner.instantiate()
	# spawn3.position = $SpiderSpawner3.position
	# spawn3.target = target
	# main.add_child(spawn3)
	# var spawn4 = spawner.instantiate()
	# spawn4.position = $SpiderSpawner4.position
	# spawn4.target = target
	# main.add_child(spawn4)
	# var spawn5 = spawner.instantiate()
	# spawn5.position = $SpiderSpawner5.position
	# spawn5.target = target
	# main.add_child(spawn5)
	current_speed = 0
