extends Node

var combinations = {
	"fries": ["oil", "potato"],
	"garliroom": ["garlic", "mushroom"],
	"garlimatato": ["garlic", "tomato"],
	"garlilato": ["garlic", "potato"],
	"poshoomto": ["potato", "mushroom"],
	"Shoomtato": ["mushroom", "tomato"],
	"Tomapotato": ["potato", "tomato"],
	"ChickenNuggets": ["chickenLeg", "oil"]
}

var ingredients = {
	"tomato": preload("res://Resources/Ingredients/tomato.png"),
	"oil": preload("res://Resources/Ingredients/sunfloweroil.png"),
	"potato": preload("res://Resources/Ingredients/potato.png"),
#	"pepper": preload("res://Resources/Ingredients/pepper.png"),
#	"onion": preload("res://Resources/Ingredients/onion.png"),
	"mushroom": preload("res://Resources/Ingredients/mushroom.png"),
#	"lemon": preload("res://Resources/Ingredients/lemon.png"),
	"garlic": preload("res://Resources/Ingredients/garlic.png"),
	"chickenLeg": preload("res://Resources/Ingredients/chickenLeg.png"),
#	"carrot": preload("res://Resources/Ingredients/carrot.png"),
#	"brocoli": preload("res://Resources/Ingredients/brocoli.png"),
}

var foods = {
	"fries": preload("res://Resources/Ingredients/potatofries.png"),
	"garliroom": preload("res://Resources/Ingredients/garliroom.png"),
	"garlimatato": preload("res://Resources/Ingredients/garlimatato.png"),
	"garlilato": preload("res://Resources/Ingredients/garlilato.png"),
	"poshoomto": preload("res://Resources/Ingredients/poshoomto.png"),
	"Shoomtato": preload("res://Resources/Ingredients/Shoomtato.png"),
	"Tomapotato": preload("res://Resources/Ingredients/Tomapotato.png"),
	"Slime": preload("res://Resources/Ingredients/Slime.png"),
	"ChickenNuggets": preload("res://Resources/Ingredients/chickenNuggets.png")
}

func combine(var ingredients: Array):
	var result = "Slime"
	for combination in combinations.keys():
		var recipe : Array = combinations[combination]
		# not the same amount of ingredients:
		if recipe.size() != ingredients.size():
			continue
		
		var hasAll = true
		for ingredient in ingredients:
			if not recipe.has(ingredient):
				hasAll = false
				break
			#remove ingredient already counted
			recipe.erase(ingredient)
				
		if hasAll:
			result = combination
			break
	return result

func get_ingredient():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(0, ingredients.size() - 1)
	return ingredients.keys()[index]
