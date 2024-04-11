extends Control
class_name IntroCard

@onready var game_scene = "res://scenes/[1]utilities/main_scene.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.paper_sound.play()
	$AnimationPlayer.play("TransitionIn")

func _on_button_pressed():
	$AnimationPlayer.play("TransitionOut")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "TransitionOut":
		get_tree().change_scene_to_file(game_scene)
