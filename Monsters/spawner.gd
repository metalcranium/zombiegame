extends Node2D

# @onready var zombie = preload("res://Monsters/zombie.tscn")
# @onready var main = get_node("/root/Main")
# var mob_count = 0
# const max_mob_count = 5
# @onready var timer: Timer = $Timer
# # Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	print("spawner ready")
# 	timer.start(1.0)
	
# # Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(_delta: float) -> void:
# 	pass
# func spawn_monsters():
# 	if mob_count >= max_mob_count:
# 		pass
# 	else:
# 		var zomb = zombie.instantiate()
# 		zomb.position = position
# 		main.add_child(zomb)
# 		mob_count += 1
		
# func _on_timer_timeout() -> void:
# 	spawn_monsters()


@onready var seer = preload("res://Monsters/seer.tscn")
@onready var zombie = preload("res://Monsters/zombie.tscn")
@onready var main = get_node("/root/Main")

@onready var timer: Timer = $Timer
var spawn_points = []

func _ready() -> void:
	print("monster spawner ready")
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)
			print(i)
			
	print("timer started")
	timer.start(3)
	
func spawn_zombie():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var zomb = zombie.instantiate()
	zomb.position = spawn.position
	main.add_child(zomb)
	print("zombie")
	main.zombie_count += 1
func spawn_seer():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var ser = seer.instantiate()
	ser.position = spawn.position
	main.add_child(ser)
	print("seer")
	main.seer_count += 1


func _on_timer_timeout() -> void:
	if main.zombie_count >= main.max_zombie_count:
		pass
	else:
		spawn_zombie()
	if main.seer_count >= main.max_seer_count:
		pass
	else:
		spawn_seer()
