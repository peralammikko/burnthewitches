extends BaseNPC

# Called when the node enters the scene tree for the first time.
func _ready():
	killValues = [3, -2, 0, 0]
	saveValues = [0, 5, 0, 2]
	Dialogic.start("Athena_intro")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		dialog = Dialogic.start("AthenaQuestions")
