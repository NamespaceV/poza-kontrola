extends CharacterBody2D

var attacks : Array[PackedScene] = [
	load("res://damage/boom.tscn")
]

var delay = 3

func _process(delta: float) -> void:
	var i = Input.get_vector("l", "r", "u", "d")
	velocity = 300 * i
	
	if move_and_slide():
		var c = get_last_slide_collision()
		var r = c.get_collider() as Debris
		if r:
			r.push_from_player(self, c)
	
	delay -= delta
	if delay <= 0:
		delay = 3
		var a = attacks.pick_random().instantiate() as Node2D
		get_tree().root.add_child(a)
		a.global_position = global_position
	
