extends Node2D

export(NodePath) var mixing_area_path
onready var mixing_area : Area2D = get_node(mixing_area_path) 

export(NodePath) var closed_fridge_path
export(NodePath) var open_fridge_path
onready var closed_fridge : Sprite = get_node(closed_fridge_path) 
onready var open_fridge : Sprite = get_node(open_fridge_path) 

export(NodePath) var closed_micro_path
export(NodePath) var open_micro_path
onready var closed_micro : Sprite = get_node(closed_micro_path) 
onready var open_micro : Sprite = get_node(open_micro_path) 

var held_object: Area2D
var initial_position: Vector2

var micro = false
var fridge = false
var time = 0
var time_wait = 7

func _ready() :
	
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("clicked", self, "_on_pickable_clicked")
#		node.connect("dead", self, "_on_ingredient_died")
		
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		initial_position = held_object.global_transform.origin
		held_object.pickup()
		
		
func _on_ingredient_died(object):
	print(" died")
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			if mixing_area.overlaps_area(held_object):
				held_object.drop("Dropped")
			else: 
				held_object.global_transform.origin = initial_position
				held_object.drop("")
			held_object = null


func _on_MixingArea_mixing( a,  b):
	micro = true

func _process(delta):
	
	if (micro):
		closed_micro.visible = true
		open_micro.visible = false
		micro = false
		time += delta
	if (time > time_wait) :
		time = 0
		closed_micro.visible = false
		open_micro.visible = true
		
	if (fridge) :
		closed_fridge.visible = false
		open_fridge.visible = true
		fridge = false
		


func _on_fridgeButton_pressed():
	fridge = true
