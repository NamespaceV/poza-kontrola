extends CharacterBody2D

var attacks : Array[PackedScene] = [
	load("res://player/damage/boom.tscn")
]
@onready var anim = $AnimationPlayer

var delay = DELAY_BETWEEN_RAGE
const DELAY_BETWEEN_RAGE = 3
const VELOCITY = 600

func _physics_process(delta: float) -> void:
	var i = Input.get_vector("l", "r", "u", "d")
	velocity = VELOCITY * i
	
	move_and_slide()

	for idx in get_slide_collision_count():
		var c = get_slide_collision(idx)
		var r = c.get_collider() as Debris
		if r:
			r.push_from_player(self, c)
	
	delay -= delta
	if delay <= 0:
		delay = DELAY_BETWEEN_RAGE
		var a = attacks.pick_random().instantiate() as Node2D
		$Dmg.add_child(a)
		anim.play("dmg")
	
