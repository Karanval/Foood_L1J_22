extends Node2D


var Block1 = [
	preload("res://Resources/Sounds/Music/Block/Block_00.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_01.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_10.ogg")]

var Block2 = [
	preload("res://Resources/Sounds/Music/Block/Block_11.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_20.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_21.ogg")]

var HappyFood = [
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_00.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_01.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_02.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_03.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_04.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_05.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_06.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_07.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_08.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_09.ogg"),
	preload("res://Resources/Sounds/Dx/HappyFood/Dx_HappyFood_10.ogg")
	]

var FearFood = [
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_00.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_01.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_02.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_03.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_04.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_05.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_06.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_07.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_08.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_09.ogg"),
	preload("res://Resources/Sounds/Dx/FearFood/FearFood_10.ogg")
	]
	
var MonsterChew = [
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_01.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_01.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_02.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_03.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_04.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_05.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_06.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_07.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_08.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_09.ogg"),
	preload("res://Resources/Sounds/Dx/Monster/MonsterChew_10.ogg")
	]


func _on_Block_1_finished():
	$Block_1.stop()
	$Block_2.stop()

	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(0, 2)
	var blocksound1 = Block1[index]
	index = random.randi_range(0, 2)
	var blocksound2 = Block2[index]

	$Block_1.stream = blocksound1
	$Block_2.stream = blocksound2

	$Block_1.play()
	$Block_2.play()


func PlayHappySound():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(0, 10)
	var happysound = HappyFood[index]

	$HappyFood.stream = happysound
	$HappyFood.play()


func PlayFearSound(node):
	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(0, 10)
	var fearsound = FearFood[index]

	$HappyFood.stream = fearsound
	$HappyFood.play()

var monster_eating = 0
func PlayMonsterSound():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(1, 10)
	var monstersound = MonsterChew[index]

	$MonsterChew.stream = monstersound
	$MonsterChew.play()



func _on_HappyFood_finished():
	$HappyFood.stop()


func _on_FearFood_finished():
	$FearFood.stop()
	
func _on_MonsterChew_finished():
	$MonsterChew.stop()
	if (monster_eating > 7) :
		monster_eating = 0
	else :
		PlayMonsterSound()

func _process(delta):
	monster_eating += delta

func _on_MixingArea_mixing(a, b):
	PlayFearSound(a)


func _on_Creator_created_ingredient(node):
	node.connect("clicked", self, "PlayFearSound")
