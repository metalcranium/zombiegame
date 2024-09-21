extends Node2D
@onready var timer: Timer = $Timer
var damage: int = 5

func _ready():
	$AnimatedSprite2D.animation = "default"
	timer.start(0.325)

func _on_timer_timeout() -> void:
	queue_free()


