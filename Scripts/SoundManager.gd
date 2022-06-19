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

func _on_HappyFood_finished():
	$HappyFood.stop()

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
	
