extends Node

func _ready() -> void:
	Console.font_size = 45
	Console.pause_enabled = true
	Console.add_command("lv", set_level, ["name"])
	Console.add_command("fullscreen", toggle_fullscreen)
	Console.add_command("restart", restart)
	Console.add_command("outro", test_outro)

func set_level(lv_name: String):
	print("changing scene to ", lv_name)
	get_tree().change_scene_to_file("res://levels/level"+lv_name+".tscn")



func next_level_sfx():
	$NextLevel.play()

func toggle_fullscreen():
	var mode = DisplayServer.WINDOW_MODE_WINDOWED
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		mode = DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(mode)

func restart():
	$AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.play()
	get_tree().change_scene_to_file("res://cutscene/intro.tscn")

func test_outro():
	get_tree().change_scene_to_file("res://cutscene/outro.tscn")
