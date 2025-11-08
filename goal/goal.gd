extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var d = body as Debris
	if d:
		if d.goal == 0:
			d.binned()
		d.goal += 1


func _on_body_exited(body: Node2D) -> void:
	var d = body as Debris
	if d:
		d.goal -= 1
