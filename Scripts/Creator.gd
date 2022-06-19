extends Node2D

export(PackedScene) var food_seed
signal created_ingredient


func create(var food_name: String, var pos: Vector2):
	
	if Recipes.foods.keys().has(food_name):
		var food = food_seed.instance()
		food.is_food = true
		food.time_period = 30
		food.ingredient_name = food_name
		var texture = Recipes.foods[food_name]
		var sprite_node: Sprite = food.get_node("Base")
		sprite_node.texture = texture
		food.global_position = pos
		
		emit_signal("created_ingredient", food)

		add_child(food)
	
	
