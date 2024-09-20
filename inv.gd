extends Control

@onready var slot_images = [$Control/GridContainer/PanelContainer1/SlotImage,$Control/GridContainer/PanelContainer2/SlotImage,$Control/GridContainer/PanelContainer3/SlotImage,$Control/GridContainer/PanelContainer4/SlotImage,$Control/GridContainer/PanelContainer5/SlotImage, $Control/GridContainer/PanelContainer6/SlotImage, $Control/GridContainer/PanelContainer7/SlotImage, $Control/GridContainer/PanelContainer8/SlotImage]
@onready var main = get_node("/root/Main/")
var slots = [null,null,null,null,null,null,null,null]
var current_item = null
var is_visible: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#slots = get_parent().get_tool_bar()
	hide()
	
func _process(_delta: float) -> void:
	slots = get_parent().get_tool_bar()
	update_inventory()
	if Input.is_action_just_pressed("inventory"):
		is_visible = !is_visible
		if !is_visible:
			hide()
		else:
			show()
func _get_drag_data(at_position: Vector2) -> Variant:
	#if not TextureRect: return
	var preview_texture = TextureRect.new()
	preview_texture = $TextureRect.texture
	preview_texture.expand_mode = -1
	preview_texture.size = Vector2(32, 32)
	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	return Node2D
	
func update_inventory():
	slots = get_parent().get_tool_bar()
	for i in range(len(slots)):
		if slots[i] != null:
			slot_images[i].texture = slots[i].image_texture
		else:
			drop_item(i)
		
func select_item(index):
	if slots[index] != null:
		get_parent().current_weapon = get_parent().tool_bar[index]
		print(get_parent().current_weapon)
	else:
		pass
func drop_item(index):
	if slots[index]:
		slots[index] = null
		slot_images[index].texture = null
		get_parent().tool_bar[index] = null
		get_parent().current_weapon = null
		update_inventory()
	
	
	

		
		
			


func _on_area_2d_mouse_entered() -> void:
	print("slot")
