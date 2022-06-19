extends Node2D

signal start
signal happyPicked
signal micro_opened

export(NodePath) var monster_area_path
onready var monster_area : Area2D = get_node(monster_area_path) 

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
var time = 0
var time_wait = 3

func created_ingredient(node):
	node.connect("clicked", self, "_on_pickable_clicked")
		
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		initial_position = held_object.global_transform.origin
		held_object.pickup()
		emit_signal("happyPicked")
		
		
func _on_ingredient_died(object):
	print(" died")
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			if mixing_area.overlaps_area(held_object) and not held_object.is_food:
				held_object.drop("Dropped")
			elif monster_area.overlaps_area(held_object) and held_object.is_food:
				held_object.die()
				monster_area.eat(held_object)
			else: 
				held_object.global_transform.origin = initial_position
				held_object.drop("")
			held_object = null


func _on_MixingArea_mixing( a,  b):
	micro = true
	time = 0

func _process(delta):
	if (micro):
		time += delta
		closed_micro.visible = true
		open_micro.visible = false
	if (micro and time > time_wait) :
		time = 0
		closed_micro.visible = false
		open_micro.visible = true
		micro = false
		emit_signal("micro_opened")


func _on_fridgeButton_pressed():
	emit_signal("start")
