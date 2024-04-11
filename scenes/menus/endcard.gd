extends IntroCard

@onready var mainmenu = "res://scenes/menus/main_menu.tscn"

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "TransitionOut":
		get_tree().change_scene_to_file(mainmenu)
