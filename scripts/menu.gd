extends Control

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_start_botton_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/game.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/options.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
