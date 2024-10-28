extends CharacterBody2D

var level: int = 1
var damage: int = 1
var max_health: float = 150
var health: float = max_health
var max_mana: float = 100
var mana: float = max_mana
var max_xp: float = 100
var xp: float = 0
var max_corruption: int = 100
var corruption: int = 0
var speed: float = 150
var has_weapon: bool = false
var can_attack: bool = true
var tool_bar = [null,null,null,null]
var inventory = [null,null,null,null,
				null,null,null,null]
var can_melee: bool = false
var item_to_drop: Node2D = null

@onready var health_bar: ProgressBar = $ProgressBar
@onready var main = get_node("/root/Main")
@onready var timer: Timer = $Timer
@onready var mana_bar: ProgressBar = $ProgressBar2
@onready var corruption_bar: ProgressBar = $ProgressBar3
@onready var xp_bar: ProgressBar = $ProgressBar4
var current_weapon: Node2D = null
var current_item: Node2D = null
@onready var tool_bar_slots: Control = $ToolBar
@onready var death_timer: Timer = $DeathTimer

func _ready():
	pass
	
func _physics_process(_delta: float) -> void:
	health_bar.value = health
	health_bar.max_value = max_health
	mana_bar.value = mana
	mana_bar.max_value = max_mana
	corruption_bar.value = corruption
	corruption_bar.max_value = max_corruption
	xp_bar.value = xp
	xp_bar.max_value = max_xp
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.animation = "walk"
	elif Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.animation = "walk"
	else:
		$AnimatedSprite2D.animation = "idle"
	move_and_slide()
	if xp >= max_xp:
		level_up()
	if health <= 0 or corruption >= max_corruption:
		die()
	if current_weapon:
		if Input.is_action_just_pressed("fire") and can_attack == true:
			if current_weapon.weapon_type == "ranged":
				can_attack = false
				current_weapon.fire()
				timer.start(current_weapon.attack_rate)
			elif current_weapon.weapon_type == "melee" and can_melee == true:
				can_attack = false
				current_weapon.fire()
				timer.start(current_weapon.attack_rate)
			elif current_weapon.weapon_type == "consumable":
				current_weapon.use()
				current_weapon.count -= 1
				if current_weapon.count <= 0:
					tool_bar_slots.drop_item(tool_bar_slots.current_item)
			
func die():
	print("dead")
	$AnimatedSprite2D.animation = "die"
	speed = 0
	main.game_over()
	
func _on_timer_timeout() -> void:
	can_attack = true
func level_up():
	max_health *= 1.10
	max_mana *= 1.10
	health = max_health
	mana = max_mana
	xp = 0
	level += 1
	max_xp *= 1.25
	main.max_seer_count += 3
	main.max_zombie_count += 5
	main.seer_count = 0
	main.zombie_count = 0
func get_tool_bar():
	return tool_bar
func get_inventory():
	return inventory

func punch(body: Node2D):
	if Input.is_action_just_pressed("fire") and can_melee == true:
		body.health -= damage
func _on_melee_range_body_entered(body: Node2D) -> void:
	can_melee = true
	punch(body)
	
func _on_melee_range_body_exited(body: Node2D) -> void:
	can_melee = false


func _on_death_timer_timeout() -> void:
	print("death timer")
	main.game_over()
