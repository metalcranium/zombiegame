extends Resource
class_name Item

var node: Node2D = null
@export var name: String
@export var texture: Texture
@export var restore_value: int
@export var quantity: int
var can_drag: bool = false
var can_select: bool = false
var item_type: String

func _ready():
	pass
func _process(delta: float):
	pass
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and can_select:
			drag()
			
func use():
	pass
func drag():
	node.position = node.get_global_mouse_position()
	print("dragging")
