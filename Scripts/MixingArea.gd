extends Area2D




func _on_MixingArea_body_entered(body):
	print("body entered")


func _on_MixingArea_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	print("mixing area")


func _on_MixingArea_area_entered(area):
	print ("area entered")
