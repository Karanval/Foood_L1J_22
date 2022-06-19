extends Control


func _ready():
	var score = Score.score
	$RichTextLabel.text = str(score)
	

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Levels/Start.tscn") 
