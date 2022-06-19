extends Area2D

signal clicked
signal dead

export var time_period : int = 20

export(NodePath) var face_path
onready var face : AnimatedSprite = get_node(face_path) 

var texture: StreamTexture
var held = false
var selectable = false
var ingredient_name: String
var time

func _ready():
	ingredient_name = Recipes.get_ingredient()
	texture = Recipes.ingredients[ingredient_name]
	load_texture(texture)
	time = 0
	face.animation = "F1"

func load_texture(var texture):
	
	var sprite : Sprite = get_child(0)
	sprite.texture = texture

func _process(delta):
	time += delta
	var step = time_period / 4
	if (time >= step and time < step + 0.5):
		face.animation = "F2"
	elif (time >= step * 2 and time < (step * 2)+0.5):
		face.animation = "F3"
	elif (time >= step * 3 and time < (step * 3)+0.5):
		face.animation = "F4"
		
	if time > time_period:
		emit_signal("dead")
	
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
