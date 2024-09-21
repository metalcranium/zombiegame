extends CharacterBody2D

@onready var hero = get_node("/root/Main/Hero")
@onready var main = get_node("/root/Main")
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var gravestone = preload("res://Scenes/gravestone.tscn")
@onready var attack_timer: Timer = $AttackTimer
@onready var orb = preload("res://Scenes/light_orb.tscn")
const max_health: int = 10
var health: int = max_health
const speed: float = 50
var current_speed: float = speed
var can_attack: bool = false
const xp_value: float = 10
var target: Node2D = null

func _ready() -> void:
	target = hero

func _physics_process(delta: float) -> void:
	progress_bar.value = health
	if target != null:
		velocity = position.direction_to(target.position).normalized() * current_speed
		chase()
	if health <= 0:
		die()
	if can_attack == true:
		attack(target)
	else:
		pass
	move_and_slide()
func die():
	print("Enemy died")
	print("You gained ", + xp_value, " xp points!")
	hero.xp += xp_value
	drop_orb()
	queue_free()
	main.score += 1
func _on_kill_zone_body_entered(body: Node2D) -> void:
	can_attack = true
	body.corruption += 1

func _on_kill_zone_body_exited(_body: Node2D) -> void:
	can_attack = false
	attack_timer.stop()
func attack(target):
	if target != null:
		print("getting attacked")
		can_attack = false
		target.health -= 3
		attack_timer.start(1)
	else:
		pass
		
func idle():
	current_speed = 0
	$AnimatedSprite2D.animation = "idle"
func chase():
	if position.x < hero.position.x:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = false
	elif position.x > hero.position.x:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = true
	
func _on_timer_timeout() -> void:
	print("timer done")
	can_attack = true
	
# func _on_detect_player_body_entered(body: Node2D) -> void:
# 	if body == hero:
# 		target = body
# 		current_speed = speed
# 		print(target)
# 	else:
# 		target = null
func drop_orb():
	var light = orb.instantiate()
	light.position = position
	main.add_child(light)
	
