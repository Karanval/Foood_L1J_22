extends Area2D

signal mixing

var  dropped_ingredients_names: Array
var dropped_ingredients: Array
var mixing = false

func _on_MixingArea_area_entered(area):
	dropped_ingredients.append(area)
	dropped_ingredients_names.append(area.ingredient_name)
	
func mix():
#	if dropped_ingredients.size() <= 1:
#		return
	if not mixing:
		mixing = true
		var result = Recipes.combine(dropped_ingredients_names)
		emit_signal("mixing", result, global_position)
		
		# removing ingredients
		for ingredient in dropped_ingredients:
			ingredient.die()	
		
		dropped_ingredients.clear()
		dropped_ingredients_names.clear()


func _on_MixingArea_area_exited(area):
	dropped_ingredients.erase(area)
	dropped_ingredients_names.erase(area.ingredient_name)


func _on_MainScene_micro_opened():
	mixing = false
