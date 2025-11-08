class_name Debris
extends RigidBody2D

const MAX_SPEED = 1_200

const PUSH_IMPULSE_STR = 2_000
const BOOM_IMPULSE_STR = 10_000

var goal = 0
var ok_color = Color("43b500ff")
var not_ok_color = Color("ffff59")

var last_on_screen_pos = Vector2(0,0)

func push_from_player(_player:Node2D, c:KinematicCollision2D):
	apply_force(-1 *  PUSH_IMPULSE_STR * c.get_normal())

func push_from_boom(boom_pos:Vector2):
	var n = (global_position - boom_pos).normalized()
	apply_impulse(1 * BOOM_IMPULSE_STR * n)


func _integrate_forces(state):
	var velocity = state.linear_velocity
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
		state.linear_velocity = velocity

func binned():
	$AudioStreamPlayer2D.play()

func _process(_delta: float) -> void:
	modulate = ok_color if goal > 0 else not_ok_color
	if global_position.x > 0 && global_position.x < 1920 \
			&& global_position.y > 0 && global_position.y < 1080:
		last_on_screen_pos = global_position
	else:
		global_position = last_on_screen_pos
