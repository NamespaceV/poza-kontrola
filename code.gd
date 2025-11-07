extends Node2D

@onready var p = $Polygon2D

func _process(delta: float) -> void:
	var i = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	p.position += 300 * i * delta
	
