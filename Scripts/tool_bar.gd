extends Control

@onready var slot_images = [$Control/GridContainer/PanelContainer1/SlotImage,$Control/GridContainer/PanelContainer2/SlotImage,$Control/GridContainer/PanelContainer3/SlotImage,$Control/GridContainer/PanelContainer4/SlotImage]
@onready var main = get_node("/root/Main/")
var slots = [null,null,null,null]
var current_item = null
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
		drop_item(current_item)
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
	
	
	

		
		
			
			
		
