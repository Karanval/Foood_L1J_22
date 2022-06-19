extends Node2D

export(PackedScene) var food_seed


func create(var food_name: String, var pos: Vector2):
	var food = food_seed.instance()
	var texture = Recipes.foods[food_name]
	var sprite_node: Sprite = food.get_node("Base")
	sprite_node.texture = texture
	food.global_position = pos

	add_child(food)
	
