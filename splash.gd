extends Control

@onready var introjingle = $kiwiScream
var mainmenu = "res://scenes/menus/main_menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$jingleTimer.start()
	$gameStartTimer.start()

func _on_jingle_timer_timeout():
	$CenterContainer/TextureRect.show()
	AudioManager.intro_jingle.play()
	
func _on_game_start_timer_timeout():
	get_tree().change_scene_to_file(mainmenu)
