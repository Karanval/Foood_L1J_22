extends Area2D

signal clicked

var held = false
var selectable = false

func _process(_delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		
func pickup():
	held = true
	
func drop():
	held = false
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and selectable:
			emit_signal("clicked", self)

func _on_Ingredient_mouse_entered():
	selectable = true


func _on_Ingredient_mouse_exited():
	selectable = false
