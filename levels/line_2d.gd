extends Line2D

@export var start:Node2D 
@export var end:Node2D 

func _process(_delta: float) -> void:
	clear_points()
	add_point(start.global_position)
	add_point(end.global_position)
	
