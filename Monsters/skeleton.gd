extends CharacterBody2D

@export var health: int = 20
const speed: int = 50
var current_speed: int = speed
@export var damage: int = 10
var target: Node2D = null
@onready var health_bar: ProgressBar = $HealthBar
@onready var attack_timer: Timer = $AttackTimer
var can_attack: bool = false
func _ready():
	pass
func _physics_process(delta: float) -> void:
	health_bar.value = health
	health_bar.max_value = health
	if target != null:
		velocity = position.direction_to(target.position).normalized() * current_speed
	else:
		pass
	move_and_slide()
	if can_attack == true:
		attack()


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



func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.

func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
