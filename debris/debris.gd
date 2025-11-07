class_name Debris
extends RigidBody2D

const MAX_SPEED = 1_200
const IMPULSE_STR = 2_000
const BOOM_IMPULSE_STR = 10_000


func push_from_player(_player:Node2D, c:KinematicCollision2D):
	apply_force(-1 *  IMPULSE_STR * c.get_normal())

func push_from_boom(boom_pos:Vector2):
	var n = (global_position - boom_pos).normalized()
	apply_impulse(1 * BOOM_IMPULSE_STR * n)


func _integrate_forces(state):
	var velocity = state.linear_velocity
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
		state.linear_velocity = velocity
