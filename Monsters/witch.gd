extends CharacterBody2D

var max_health: int = 30
var health: int = max_health
var speed: int = 50
var current_speed: int = speed
var xp_value: int = 15
var target: Node2D = null
var can_attack: bool = false
var damage: int = 5
var spider_count: int = 0
@onready var spider_spawner = [$SpiderSpawner1, $SpiderSpawner2, $SpiderSpawner3, $SpiderSpawner4, $SpiderSpawner5]
@onready var spider = preload("res://Monsters/spider.tscn")
@onready var spawner = preload("res://Monsters/spider_spawner.tscn")
@onready var main = get_node("/root/Main")

func _ready():
	pass

func _physics_process(_delta: float) -> void:

	spider_spawner[0].position.x = position.x 
	spider_spawner[0].position.y = position.y + 60
	spider_spawner[1].position.x = position.x - 60
	spider_spawner[1].position.y = position.y + 25
	spider_spawner[2].position.x = position.x + 60
	spider_spawner[2].position.y = position.y + 25
	spider_spawner[3].position.x = position.x - 40
	spider_spawner[3].position.y = position.y - 40
	spider_spawner[4].position.x = position.x + 40
	spider_spawner[4].position.y = position.y - 40
	if target != null:
		velocity = position.direction_to(target.position) * current_speed
	else:
		pass

	move_and_slide()

func _on_area_2d_body_exited(_body:Node2D) -> void:
	current_speed = speed

func _on_area_2d_body_entered(body:Node2D) -> void:
	if spider_count > 0:
		pass
	else:
		target = body
		var spawn1 = spider.instantiate()
		spawn1.position = spider_spawner[0].position
		spawn1.target = target
		main.add_child(spawn1)
		spider_count += 1
		var spawn2 = spider.instantiate()
		spawn2.position = spider_spawner[1].position	
		spawn2.target = target
		main.add_child(spawn2)
		spider_count += 1
		var spawn3 = spider.instantiate()
		spawn3.position = spider_spawner[2].position
		spawn3.target = target
		main.add_child(spawn3)
		spider_count += 1
		var spawn4 = spider.instantiate()
		spawn4.position = spider_spawner[3].position
		spawn4.target = target
		main.add_child(spawn4)
		spider_count += 1
		var spawn5 = spider.instantiate()
		spawn5.position = spider_spawner[4].position
		spawn5.target = target
		main.add_child(spawn5)
		spider_count += 1
		current_speed = 0
