extends Node2D

signal eating
signal died

export var time_period : int = 30

var time = 0
var reset = false

func _ready():
	$HSlider.max_value = time_period

func _on_Monster_area_entered(area):
	pass

func _process(delta):
	time += delta
	if not reset:
		$HSlider.value = time_period - time
	else:
		reset = false
		time = 0
	if (time >= time_period) :
		die()

func eat(food) :
	$AnimatedSprite.animation = "eating"
	
	if food.ingredient_name != "Slime":
		$Particles2D.emitting = true
		Score.score += 10
		time -= 5
	else:
		Score.score += 2
		time -= 0.5
	emit_signal("eating")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "killed":
		reset = true
	$AnimatedSprite.animation = "idle"

func die():
	$AnimatedSprite.animation = "killed"
	emit_signal("died")
	time = 0


func _on_MainScene_start():
	$AnimatedSprite.animation = "idle"
