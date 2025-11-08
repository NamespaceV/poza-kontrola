extends AnimationPlayer

func _ready() -> void:
	animation_finished.connect(on_anim_finished)
	
func on_anim_finished(anim_name:String):
	match anim_name:
		"intro":
			play("intro2")
			return
		"intro2":
			play("intro3")
			return
		"intro3":
			play("intro4")
			return
		_:
			GLOBAL.set_level("1")

func spawn_explosion():
	var s = load("res://player/damage/boom.tscn") as PackedScene
	var n = s.instantiate() as Node2D
	add_child(n)
	n.global_position = $"../PlayerHappy".global_position
