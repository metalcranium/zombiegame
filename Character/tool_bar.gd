extends Control

@onready var slot_images = [$Control/GridContainer/Button1/SlotImage,$Control/GridContainer/Button2/SlotImage,$Control/GridContainer/Button3/SlotImage,$Control/GridContainer/Button4/SlotImage]
@onready var main = get_node("/root/Main/")
@onready var inventory = get_node("/root/Main/Hero/Inventory")
@onready var slots = get_parent().tool_bar
var current_item = null
var can_select: bool = false
var slot_index = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#slots = get_parent().get_tool_bar()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	slots = get_parent().get_tool_bar()
	update_inventory()
	if Input.is_action_just_pressed("slot1"):
		current_item = 0
		select_item(current_item)
		
	if Input.is_action_just_pressed("slot2"):
		current_item = 1
		select_item(current_item)
		
	if Input.is_action_just_pressed("slot3"):
		current_item = 2
		select_item(current_item)
		
	if Input.is_action_just_pressed("slot4"):
		current_item = 3
		select_item(current_item)
		
	if Input.is_action_just_pressed("drop_weapon"):
		pass
	if slot_index == null:
		pass
	else:
		if inventory.selected_item != null and Input.is_action_just_released("fire"):
			add_item(slot_index)
		if can_select and Input.is_action_pressed("fire"):
			if slots[slot_index] != null:
				inventory.selected_item = slots[slot_index].duplicate()
				slots[slot_index] = null
				main.add_child(inventory.selected_item)
				inventory.selected_item.can_drag = true
			else:
				pass
		elif can_select and Input.is_action_just_pressed("secondary"):
			slots[slot_index].use()
func update_inventory():
	slots = get_parent().get_tool_bar()
	for i in range(len(slots)):
		if slots[i] != null:
			slot_images[i].texture = slots[i].texture
		else:
			remove_item(i)
func add_item(index):
	if get_parent().tool_bar[index] == null:
		if inventory.selected_item != null:
			print(inventory.selected_item.position)
			if Input.is_action_just_released("fire"):
				get_parent().tool_bar[index] = inventory.selected_item.duplicate()
				get_parent().add_child(get_parent().tool_bar[index])
				print("image texture: ", get_parent().tool_bar[index].image_texture)
				inventory.selected_item.queue_free()
				inventory.selected_item = null
				update_inventory()
			inventory.can_drop = false
	else:
		pass
		
func select_item(index):
	if slots[index] != null:
		get_parent().current_weapon = slots[index]
		print(get_parent().current_weapon)
	else:
		get_parent().current_weapon = null

func remove_item(index):
	get_parent().tool_bar[index] = null
	slot_images[index].texture = null
func _on_button_1_pressed() -> void:
	current_item = 0
	select_item(current_item)
func _on_button_2_pressed() -> void:
	current_item = 1
	select_item(current_item)
func _on_button_3_pressed() -> void:
	current_item = 2
	select_item(current_item)
func _on_button_4_pressed() -> void:
	current_item = 3
	select_item(current_item)


func _on_button_1_mouse_entered() -> void:
	slot_index = 0
	can_select = true


func _on_button_1_mouse_exited() -> void:
	slot_index = null
	can_select = false


func _on_button_2_mouse_entered() -> void:
	slot_index = 1
	can_select = true


func _on_button_2_mouse_exited() -> void:
	slot_index = null
	can_select = false

func _on_button_3_mouse_entered() -> void:
	slot_index = 2
	can_select = true


func _on_button_3_mouse_exited() -> void:
	slot_index = null
	can_select = false


func _on_button_4_mouse_entered() -> void:
	slot_index = 3
	can_select = true


func _on_button_4_mouse_exited() -> void:
	slot_index = null
	can_select = false
