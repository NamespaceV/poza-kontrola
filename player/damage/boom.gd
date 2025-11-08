extends Node2D


func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	apply_physics_impulse()
	await get_tree().create_timer(0.2).timeout
	queue_free()


func apply_physics_impulse():
	var shape = CircleShape2D.new()
	shape.radius = 200

	var params = PhysicsShapeQueryParameters2D.new()
	params.shape = shape
	params.transform = Transform2D(0, global_position)
	#params.collision_mask = target_collision_layers_mask
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_shape(params)
	for item in result:
		#print(item.collider)
		var r = item.collider as Debris
		if r:
			r.push_from_boom(global_position)
