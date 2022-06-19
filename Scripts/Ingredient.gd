extends Area2D

signal clicked
signal dead

export var time_period : int = 5

export(NodePath) var face_path
onready var face : AnimatedSprite = get_node(face_path) 

var texture: StreamTexture
var held = false
var selectable = false
var change_face = true
var ingredient_name: String
var time
var saved_animation
var is_food

func _ready():
	ingredient_name = Recipes.get_ingredient()
	texture = Recipes.ingredients[ingredient_name]
	if not is_food:
		load_texture(texture)
	time = 0
	face.animation = "F1"

func load_texture(var texture):
	var sprite : Sprite = get_child(0)
	sprite.texture = texture

func _process(delta):
	time += delta
	var step = time_period / 4
	if change_face and (time >= step and time < step + 0.5):
		face.animation = "F2"
	elif change_face and (time >= step * 2 and time < (step * 2)+0.5):
		face.animation = "F3"
	elif change_face and (time >= step * 3 and time < (step * 3)+0.5):
		face.animation = "F4"
		
	if time > time_period:
		die()
	
	if held:
		global_transform.origin = get_global_mouse_position()
		
func pickup():
	held = true
	saved_animation = face.animation
	face.animation = "Dragging"
	
func drop(var animation):
	held = false
	if animation == "Dropped":
		face.animation = animation
		change_face = false
	else: 
		face.animation = saved_animation
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and selectable:
			emit_signal("clicked", self)

func _on_Ingredient_mouse_entered():
	selectable = true

func _on_Ingredient_mouse_exited():
	selectable = false
	
func die():
	emit_signal("dead", self)
	scale.y = 0.1
#	global_position = Vector2(global_position.x, global_position.y + 35)
	$Face.visible = false
	queue_free()
