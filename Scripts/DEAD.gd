extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var score = Score.score
	$RichTextLabel.text = str(score)
	

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Levels/Start.tscn") 
