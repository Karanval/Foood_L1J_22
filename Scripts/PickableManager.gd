extends Node2D

export(NodePath) var mixing_area_path
onready var mixing_area : Area2D = get_node(mixing_area_path) 

var held_object: Area2D
var initial_position: Vector2

func _ready() :
	
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("clicked", self, "_on_pickable_clicked")
		
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		initial_position = held_object.global_transform.origin
		held_object.pickup()
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			if mixing_area.overlaps_area(held_object):
				held_object.drop()
			else: 
				held_object.global_transform.origin = initial_position
				held_object.drop()
			held_object = null
