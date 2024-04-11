extends BaseNPC

# Called when the node enters the scene tree for the first time.
func _ready():
	killValues = [1, 0, 0, 1]
	saveValues = [0, 1, 1, -1]
	Dialogic.start("Athena_intro")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		dialog = Dialogic.start("AthenaQuestions")
