extends StaticBody2D

signal clicked

var held = false

func _ready(): 
	input_pickable = true;

func _process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		
func pickup():
	held = true
	
func drop():
	held = false
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("clicked", self)
			
