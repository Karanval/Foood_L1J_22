extends Node2D



func _on_Monster_area_entered(area):
	pass


func eat() :
	$AnimatedSprite.animation = "eating"
	Score.score += 10

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.animation = "idle"
