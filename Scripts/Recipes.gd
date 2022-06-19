extends Node

var combinations = {
	"fries": ["oil", "potato"],
	"juice": ["carrot"]
}

var ingredients = {
#	"tomato": preload("res://Resources/Ingredients/tomato.png"),
	"oil": preload("res://Resources/Ingredients/sunfloweroil.png"),
	"potato": preload("res://Resources/Ingredients/potato.png"),
#	"pepper": preload("res://Resources/Ingredients/pepper.png"),
#	"onion": preload("res://Resources/Ingredients/onion.png"),
#	"mushroom": preload("res://Resources/Ingredients/mushroom.png"),
#	"lemon": preload("res://Resources/Ingredients/lemon.png"),
#	"garlic": preload("res://Resources/Ingredients/garlic.png"),
#	"chickenLeg": preload("res://Resources/Ingredients/chickenLeg.png"),
	"carrot": preload("res://Resources/Ingredients/carrot.png"),
#	"brocoli": preload("res://Resources/Ingredients/brocoli.png")
}

var foods = {
	"fries": preload("res://Resources/Ingredients/potatofries.png")
}

func combine(var ingredients: Array):
	var result = ""
	for combination in combinations.keys():
		var hasAll = true
		
		for ingredient in ingredients:
			if not combinations[combination].has(ingredient):
				hasAll = false
				break;
				
		if hasAll:
			result = combination
			break;
	return result

func get_ingredient():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(0, ingredients.size() - 1)
	return ingredients.keys()[index]
