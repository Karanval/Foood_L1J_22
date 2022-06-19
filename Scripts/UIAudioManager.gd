extends Control

var Button = [
	preload("res://Resources/Sounds/UI/UI_01.ogg"),
	preload("res://Resources/Sounds/UI/UI_02.ogg"),
	preload("res://Resources/Sounds/UI/UI_03.ogg"),
	preload("res://Resources/Sounds/UI/UI_04.ogg")
	]

var random

func _ready():
	random = RandomNumberGenerator.new()


func _on_TextureButton_pressed():
	random.randomize()
	var index = random.randi_range(0, 3)
	var sound = Button[index]
	$AudioStreamPlayer.stream = sound
	$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()
