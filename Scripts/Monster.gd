extends Node2D

signal eating

export var time_period : int = 5
var time = 0

func _on_Monster_area_entered(area):
	pass

func _process(delta):
	time += delta
	if (time >= time_period) :
		die()

func eat() :
	$AnimatedSprite.animation = "eating"
	emit_signal("eating")
	Score.score += 10
	time -= 5

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.animation = "idle"

func die():
	get_tree().change_scene("res://Levels/DEAD.tscn") 
