extends Area2D

var dialog

var killValues = [+1, 0, 0, +1]
var saveValues = [0, +1, +1, -1]

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	Dialogic.start("thirla_questions")
	
func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		#dialog = Dialogic.start("thirla_questions", "thirla_questioning")
		pass
		
func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
