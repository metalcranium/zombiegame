extends Sprite2D

@onready var inventory = get_node("/root/Main/Inventory'")
@onready var main = get_node("/root/Main")
@onready var item_pickup = load("res://item_pickup.tscn")
@onready var texture_image = load("res://icon.svg")
var index = null
var can_drag: bool = false
var can_select: bool = false
func _ready():
	pass
func _process(_delta: float) -> void:
	index = inventory.slot_index
	if index == null and Input.is_action_just_pressed("fire"):
		spawn_item()
	if can_select:
		if Input.is_action_just_pressed("fire"):
			can_drag = !can_drag
	if can_drag:
		drag_item()
func drag_item():
	position = get_global_mouse_position()
	inventory.selected_item = self
func _on_area_2d_mouse_exited() -> void:
	can_select = false
	print("can drag: ", can_drag)
	inventory.selected_item = null
func _on_area_2d_mouse_entered() -> void:
	can_select = true
	print("can drag: ", can_drag)
func spawn_item():
	var item = item_pickup.instantiate()
	print("created item pickup: ", item)
	item.position = get_global_mouse_position()
	main.add_child(item)
	self.queue_free()
func say():
	print("I am an item")
