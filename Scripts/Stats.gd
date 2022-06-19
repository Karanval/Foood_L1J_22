extends Node2D

var lives

func _ready():
	$RichTextLabel.text = "0"
	lives = 4


func _on_Monster_eating():
	$RichTextLabel.text = str(Score.score)



func _on_Monster_died():
	lives -= 1
	if (lives == 0):
		get_tree().change_scene("res://Levels/DEAD.tscn") 
	elif lives == 3:
		$Heart5.visible = false
	elif lives == 2:
		$Heart3.visible = false
	elif lives == 1:
		$Heart2.visible = false
