extends BaseNPC

func _ready():
	killValues = [0, 0, 0, 1]
	saveValues = [2, -2, 0, 0]
	Dialogic.start("kordon_intro")
	
func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		dialog = Dialogic.start("kordon_intro", "kordon_questions")
