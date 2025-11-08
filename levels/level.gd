extends Node2D

@export var next_level : PackedScene

func get_all_debris(root: Node) -> Array[Debris]:
	var result = [] as Array[Debris]
	if root is Debris:
		result.append(root)
	for child in root.get_children():
		result += get_all_debris(child)
	return result

func _process(_delta: float) -> void:
	var d = get_all_debris(get_tree().root)
	if d.all(func (n): return n.goal > 0):
		print("WIN ", d.size())
		get_tree().change_scene_to_packed(next_level)
