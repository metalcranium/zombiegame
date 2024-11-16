extends CharacterBody2D


const max_health: int = 20
var health: int = max_health
const speed: float = 50                   
var current_speed = speed
const xp_value: float = 15
var can_attack: bool = true
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var main = get_node("/root/Main")
@onready var dark_fireball = preload("res://Weapons/dark_fireball.tscn")
@onready var orb = preload("res://Scenes/light_orb.tscn")
@onready var timer: Timer = $Timer
var target: Node2D = null

func _ready():
	pass
func _physics_process(_delta: float) -> void:
	print("can attack: ", can_attack)
	progress_bar.value = health
	if target != null:
		chase()
		shoot()
	else:
		idle()
	
	move_and_slide()
	if health <= 0:
		die()

func _on_kill_zone_body_entered(body: Node2D) -> void:
	body.corruption -= 5

func _on_timer_timeout() -> void:
	can_attack = true
func die():
	print("Enemy died")
	print("You gained ", + xp_value," xp points!")
	target.xp += 5
	main.score += 1
	drop_orb()
	queue_free()
func idle():
	current_speed = 0
func chase():
	velocity = position.direction_to(target.position).normalized() * current_speed
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
func shoot():
	if can_attack == true:
		var dark_fb = dark_fireball.instantiate()
		dark_fb.target = target
		dark_fb.position = position
		main.add_child(dark_fb)
		can_attack = false
		timer.start()

func _on_detect_body_entered(body: Node2D) -> void:
	print("entered")
	if target == null:
		target = body
	else:
		pass
	current_speed = 0
	shoot()
func _on_detect_body_exited(body: Node2D) -> void:
	print("exited")
	current_speed = speed

func drop_orb():
	var light = orb.instantiate()
	#light.xp_value = xp_value
	light.position = position
	main.add_child(light)
