extends Area2D

@onready var spawner = get_node("/root/MainScene/Spawner")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("TransitionIn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer/CanvasLayer.hide()


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed('leftclick') && !spawner.customer_in:
		$AnimationPlayer/CanvasLayer.show()
		$AnimationPlayer.play("TransitionInOut")
		spawner.spawn_new_customer()
