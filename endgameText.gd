extends Control

var endgameQuotes: Dictionary
var stats = globalStats.alignStats
var textLines: int
var quoteArray: Array = []
var i: int = 0

@onready var mainmenu = "res://scenes/menus/main_menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/quoteText.text = ""
	openJson()
	getEndquotes()
	AudioManager.end_ambiance.play()
	
func getEndquotes():
	var statValue: int = globalStats.getHighest()
	var alignmentType: String = stats.find_key(statValue)
	match alignmentType:
		"order":
			quoteArray = endgameQuotes["order"]
		"rebel":
			quoteArray = endgameQuotes["rebel"]
		"good":
			quoteArray = endgameQuotes["good"]
		"evil":
			quoteArray = endgameQuotes["evil"]

func _on_timer_timeout():
	if i < textLines:
		$VBoxContainer/quoteText.text += "
		
		" + quoteArray[i]
		AudioManager.end_text_appear.play()
		i += 1
	elif i == textLines:
		$HBoxContainer/quitButton.show()
	else:
		pass
	
func openJson():
	var file = "res://assets/dialogue/endgame_text.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	if json_as_dict:
		endgameQuotes = json_as_dict
		textLines = endgameQuotes.size()


func _on_quit_button_pressed():
	$AnimationPlayer.play("TransitionOut")


func _on_animation_player_animation_finished(anim_name):
	AudioManager.end_ambiance.stop()
	get_tree().change_scene_to_file(mainmenu)
