extends Node2D

@onready var hero: CharacterBody2D = %Hero
@onready var main = get_node("/root/Main")
var max_zombie_count: int = 15
var zombie_count: int = 0
var max_seer_count: int = 5
var seer_count: int = 0
var score: int = 0
var goal = max_seer_count + max_zombie_count

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if score == goal:
		print("You win!!!!!!!!!!!!!")
func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")



	
