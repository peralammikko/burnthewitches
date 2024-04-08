extends Area2D

@onready var spawner = get_node("/root/MainScene/Spawner")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("TransitionIn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "TransitionOut":
		spawner.spawn_new_customer()
		$AnimationPlayer.play("TransitionIn")
	elif anim_name == "TransitionIn":
		$AnimationPlayer/CanvasLayer.hide()

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed('leftclick'):
		if !spawner.customer_in:
			AudioManager.door_open_sound.play()
			$AnimationPlayer/CanvasLayer.show()
			$AnimationPlayer.play("TransitionOut")
