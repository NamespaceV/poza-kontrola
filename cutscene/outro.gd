extends AnimationPlayer

func _ready() -> void:
	animation_finished.connect(on_anim_finished)

func on_anim_finished(_anim_name:String):
	var amim_name = ["lspin", "rspin", "hop"].pick_random()
	await get_tree().create_timer(randf_range(0.3, 0.8)).timeout
	play(amim_name)
