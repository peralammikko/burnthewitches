extends Area2D
class_name BaseNPC

var dialog
@export var npcValues: JSON

var killValues: Array
var saveValues: Array

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	pass

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		pass
		
func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
