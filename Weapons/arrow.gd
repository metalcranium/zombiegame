extends CharacterBody2D
@onready var main = get_node("/root/Main")
@onready var hero = get_node("/root/Main/Hero")

const speed: float = 300.0
var damage: int = 8

func _ready():
	#look_at(get_global_mouse_position())
	$Sprite2D.flip_h = true
	
func _process(delta: float) -> void:
	position += transform.x * speed * delta
	
func _on_kill_enemy_body_entered(body: Node2D) -> void:
	print("hit")
	body.health -= damage + main.hero.damage
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("Arrow destroyed")
