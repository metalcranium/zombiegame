extends CharacterBody2D


const max_health: int = 20
var health: int = max_health
const speed: float = 50                   
var current_speed = speed
const xp_value: float = 15

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var hero = get_node("/root/Main/Hero")
@onready var main = get_node("/root/Main")
@onready var dark_fireball = preload("res://Weapons/dark_fireball.tscn")
@onready var orb = preload("res://Scenes/light_orb.tscn")
@onready var timer: Timer = $Timer
var target: Node2D = null

func _ready():
	target = hero
	
func _physics_process(delta: float) -> void:
	progress_bar.value = health
	if target == null:
		idle()
	else:
		velocity = position.direction_to(target.position).normalized() * current_speed
		chase()
	
	move_and_slide()
	if health <= 0:
		die()

func _on_kill_zone_body_entered(body: Node2D) -> void:
	body.health -= 5

func _on_timer_timeout() -> void:
	shoot()
	timer.start()
func die():
	print("Enemy died")
	print("You gained ", + xp_value," xp points!")
	main.score += 1
	drop_orb()
	queue_free()
func idle():
	current_speed = 0
func chase():
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
func shoot():
	var dark_fb = dark_fireball.instantiate()
	dark_fb.position = position
	main.add_child(dark_fb)

func _on_detect_body_entered(body: Node2D) -> void:
	target = body
	current_speed = 0


func _on_detect_body_exited(body: Node2D) -> void:
	current_speed = speed

func drop_orb():
	var light = orb.instantiate()
	light.xp_value = xp_value
	light.position = position
	main.add_child(light)
