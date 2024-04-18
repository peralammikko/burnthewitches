extends Area2D

@onready var spawner = get_node("/root/MainScene/Spawner")
@onready var end_screen = get_node("/root/MainScene/CanvasLayer/end_day_screen")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("TransitionIn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "TransitionOut":
		AudioManager.background_ambiance.stop()
		AudioManager.stamp_sound.play()
		end_screen.show()
		end_screen.display_stats()

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed('leftclick'):
		if !spawner.customer_in:
			$AnimationPlayer/CanvasLayer.show()
			$AnimationPlayer.play("TransitionOut")
