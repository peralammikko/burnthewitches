extends Area2D

var dialog
@export var npcValues: JSON

var killValues = [-1, +2, +2, -1]
var saveValues = [+2, -1, -2, +1]

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	Dialogic.start("kordon_intro")
	

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		dialog = Dialogic.start("kordon_intro", "kordon_questions")
		
func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
