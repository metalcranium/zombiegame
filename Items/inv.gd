extends Control

@onready var slot_images = [$Control/GridContainer/PanelContainer1/SlotImage,$Control/GridContainer/PanelContainer2/SlotImage,$Control/GridContainer/PanelContainer3/SlotImage,$Control/GridContainer/PanelContainer4/SlotImage,$Control/GridContainer/PanelContainer5/SlotImage, $Control/GridContainer/PanelContainer6/SlotImage, $Control/GridContainer/PanelContainer7/SlotImage, $Control/GridContainer/PanelContainer8/SlotImage]
@onready var main = get_node("/root/Main/")
var slots = [null,null,null,null,null,null,null,null]
var current_item: int
var is_visible: bool = false

func _ready() -> void:
	hide()
	
func _process(_delta: float) -> void:
	slots = get_parent().get_inventory()
	update_inventory()
	if Input.is_action_just_pressed("inventory"):
		is_visible = !is_visible
		if !is_visible:
			hide()
			get_parent().selected_item = null
		else:
			show()
	if Input.is_action_just_pressed("use_item"):
		if get_parent().health < get_parent().max_health:
			if get_parent().current_item != null:
				get_parent().current_item.use()
				print("item used")
				drop_item(current_item)
			else:
				pass
			
		else:
			print("health is full")
			pass

func update_inventory():
	slots = get_parent().get_inventory()
	for i in range(len(slots)):
		if slots[i] != null:
			slot_images[i].texture = slots[i].image_texture
		else:
			drop_item(i)
		
func select_item(index):
	if slots[index] != null:
		get_parent().current_item = get_parent().inventory[index]
		print(get_parent().current_item)
	else:
		get_parent().current_item = null
		print("no item")
func drop_item(index):
	if slots[index]:
		slots[index] = null
		slot_images[index].texture = null
		get_parent().tool_bar[index] = null
		get_parent().current_item = null
		update_inventory()

func _on_panel_container_1_pressed() -> void:
	current_item = 0
	select_item(current_item)
func _on_panel_container_2_pressed() -> void:
	current_item = 1
	select_item(current_item)
func _on_panel_container_3_pressed() -> void:
	current_item = 2
	select_item(current_item)
func _on_panel_container_4_pressed() -> void:
	current_item = 3
	select_item(current_item)
func _on_panel_container_5_pressed() -> void:
	current_item = 4
	select_item(current_item)
func _on_panel_container_6_pressed() -> void:
	current_item = 5
	select_item(current_item)
func _on_panel_container_7_pressed() -> void:
	current_item = 6
	select_item(current_item)
func _on_panel_container_8_pressed() -> void:
	current_item = 7
	select_item(current_item)
