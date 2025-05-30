extends CharacterBody2D

@onready var hero = get_node("/root/Main/Hero")
@onready var timer: Timer = $Timer
var target: Node2D = null
var damage: int = 5
const speed: float = 125
var health: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = hero
	print("dark fire ball")
	look_at(target.position)
	timer.start(5.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	$Sprite2D.flip_h = true
	position += position.direction_to(target.position) * speed * delta
	look_at(target.position)
	if health <= 0:
		queue_free()
	
func _on_kill_enemy_body_entered(body: Node2D) -> void:
	body.health -= damage
	body.corruption += 5
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
