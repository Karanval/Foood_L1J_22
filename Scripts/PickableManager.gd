extends Node2D

export(NodePath) var mixing_area_path
onready var mixing_area = get_node(mixing_area_path)

var held_object

func _ready() :
	
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("clicked", self, "_on_pickable_clicked")
		
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		
		
" ""get_overlapping_bodies" ""
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			if mixing_area.
			held_object.drop()
			held_object = null
