extends BaseNPC

func _ready():
	killValues = [-1, +2, +2, -1]
	saveValues = [+2, -1, -2, +1]
	Dialogic.start("kordon_intro")
	
func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		dialog = Dialogic.start("kordon_intro", "kordon_questions")
