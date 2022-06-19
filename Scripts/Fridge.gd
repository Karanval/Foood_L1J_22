extends Sprite

signal created_ingredient
export(PackedScene) var food_seed

var ingredients: Array
var timer = false
var time = 0
var spwan_time = 2

func _process(delta):
	if timer:
		time += delta
		if time > spwan_time:
			time = 0
			create()
			timer = false
		
func reset():
	close()
	timer = true
	time = 0

func close():
	visible = false

func create():
	visible = true
	var name = Recipes.get_ingredient()
	
	create_in_fridge(name, Vector2(210, -395))
	name = Recipes.get_ingredient()
	create_in_fridge(name, Vector2(218, -28))
	name = Recipes.get_ingredient()
	create_in_fridge(name, Vector2(225, 330))
	

func create_in_fridge(var food_name: String, var pos: Vector2):
	var food = food_seed.instance()
	food.time_period = 15
	var texture = Recipes.ingredients[food_name]
	var sprite_node: Sprite = food.get_node("Base")
	sprite_node.texture = texture
	food.global_position = pos
	ingredients.append(food)

	emit_signal("created_ingredient", food)
	food.connect("dead", self, "ingredient_died")

	add_child(food)

func ingredient_died(var ingredient):
	if ingredients.has(ingredient):
		ingredients.erase(ingredient)
	if ingredients.size() == 0:
		reset()


func _on_MainScene_start():
	create()
