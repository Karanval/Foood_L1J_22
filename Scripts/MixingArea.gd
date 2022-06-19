extends Area2D

signal mixing

var dropped_ingredients_names: Array
var dropped_ingredients: Array

func _on_MixingArea_area_entered(area):
	dropped_ingredients_names.append(area.ingredient_name)
	dropped_ingredients.append(area)
	
func mix():
	if dropped_ingredients.size() == 0:
		return
	
	var result = Recipes.combine(dropped_ingredients_names)
	emit_signal("mixing", result, global_position)
#	Recipes.create(result, global_position)
	
	# removing ingredients
	for ingredient in dropped_ingredients:
		ingredient.queue_free()	
	
	dropped_ingredients.clear()
	dropped_ingredients_names.clear()

