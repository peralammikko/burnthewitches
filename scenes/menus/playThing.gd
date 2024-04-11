extends MenuElement

@onready var introCardScene = "res://scenes/menus/introcard.tscn"

func _on_button_pressed():
	get_tree().change_scene_to_file(introCardScene)
