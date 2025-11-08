extends Node

func _ready() -> void:
	Console.font_size = 45
	Console.pause_enabled = true
	Console.add_command("lv", set_level, ["name"])

func set_level(lv_name: String):
	print("changing scene to ", lv_name)
	get_tree().change_scene_to_file("res://levels/level"+lv_name+".tscn")

func next_level_sfx():
	$NextLevel.play()
