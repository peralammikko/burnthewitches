extends BaseNPC


# Called when the node enters the scene tree for the first time.
func _ready():
	#killValues = [1, 0, -1, 1]
	#saveValues = [-1, 2, 0, 1]
	killValues = [2, 0, -2, 2]
	saveValues = [-2, 4, 0, 2]
	Dialogic.start("TieganQuestions")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		dialog = Dialogic.start("TieganQuestions")
