extends BaseNPC


# Called when the node enters the scene tree for the first time.
func _ready():
	killValues = [0, -2, 0, 1]
	saveValues = [0, 0, 2, 0]
	Dialogic.start("TieganQuestions")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		dialog = Dialogic.start("TieganQuestions", "provost_branching")
