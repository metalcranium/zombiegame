extends CharacterBody2D

@export var health: int = 20
const speed: int = 50
var current_speed: int = speed
@export var damage: int = 10
var target: Node2D = null
@onready var health_bar: ProgressBar = $HealthBar
@onready var attack_timer: Timer = $AttackTimer
@onready var orb = preload("res://Scenes/light_orb.tscn")
@onready var main = get_node("/root/Main")
var xp_value = 15
var can_attack: bool = false
func _ready():
	pass
func _physics_process(delta: float) -> void:
	health_bar.value = health
	if target != null:
		velocity = position.direction_to(target.position).normalized() * current_speed
	else:
		pass
	move_and_slide()
	if can_attack == true:
		attack()
	if health <= 0:
		die()


func _on_detect_player_body_entered(body:Node2D) -> void:
	target = body

func _on_kill_zone_body_exited(body:Node2D) -> void:
	can_attack = false
	attack_timer.stop()

func _on_kill_zone_body_entered(body:Node2D) -> void:
	can_attack = true

func attack():
	if target != null:
		can_attack = false
		target.health -= damage
		attack_timer.start(1)
	else:
		pass
func die():
	drop_orb()
	queue_free()

func drop_orb():
	var light = orb.instantiate()
	light.position = position
	light.xp_value = xp_value
	main.add_child(light)

func _on_attack_timer_timeout() -> void:
	can_attack = true
