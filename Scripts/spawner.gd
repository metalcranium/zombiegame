extends Marker2D

@onready var zombie = preload("res://zombie.tscn")
@onready var main = get_node("/root/Main")
var mob_count = 0
const max_mob_count = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func spawn_monsters():
	if mob_count >= max_mob_count:
		pass
	else:
		main.add_child(zombie.instantiate())
		mob_count += 1
		
func _on_timer_timeout() -> void:
	spawn_monsters()
