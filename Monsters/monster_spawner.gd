extends Marker2D

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
