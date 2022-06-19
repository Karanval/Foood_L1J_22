extends Node2D


var sounds1 = [
	preload("res://Resources/Sounds/Music/Block/Block_00.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_01.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_10.ogg")]
	
var sounds2 = [
	preload("res://Resources/Sounds/Music/Block/Block_11.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_20.ogg"),
	preload("res://Resources/Sounds/Music/Block/Block_21.ogg")]
	

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer2.stop()
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	var index = random.randi_range(0, 2)
	var sound1 = sounds1[index]
	index = random.randi_range(0, 2)
	var sound2 = sounds2[index]
	
	$AudioStreamPlayer.stream = sound1
	$AudioStreamPlayer2.stream = sound2
	
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.play()

