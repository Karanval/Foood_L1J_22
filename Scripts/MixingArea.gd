extends Area2D

var dropped_ingredients: Array

func _on_MixingArea_area_entered(area):
	dropped_ingredients.append(area.ingredient_name)
	
	if dropped_ingredients.size() > 1:
		
		print(Recipes.combine(dropped_ingredients))
