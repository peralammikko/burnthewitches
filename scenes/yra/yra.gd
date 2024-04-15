extends BaseNPC

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	killValues = [+1, 0, 0, +1]
	saveValues = [0, +1, +1, -1]
	Dialogic.start("suspect_3")
	
func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		dialog = Dialogic.start("suspect_3", "yra_questions")
