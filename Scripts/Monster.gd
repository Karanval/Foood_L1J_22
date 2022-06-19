extends Node2D


export var time_period : int = 30
var time = 0

func _on_Monster_area_entered(area):
	pass

func _process(delta):
	time += delta
	if (time >= time_period) :
		die()

func eat() :
	$AnimatedSprite.animation = "eating"
	Score.score += 10

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.animation = "idle"

func die():
	pass
