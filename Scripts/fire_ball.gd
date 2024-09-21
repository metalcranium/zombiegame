extends Node2D

@onready var main = get_node("/root/Main")
var damage: int = 5
var speed: int = 300
@onready var impact = preload("res://fire_ball_impact.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	look_at(get_global_mouse_position())
	$AnimatedSprite2D.animation = "shoot"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.flip_h = true
	position += transform.x * speed * delta
	
func _on_kill_enemy_body_entered(body: Node2D) -> void:
	body.health -= damage
	var imp = impact.instantiate()
	imp.position = body.position
	main.add_child(imp)
	queue_free()
	
