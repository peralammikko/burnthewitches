extends BaseNPC

func _ready():
	#killValues = [-1, +2, +2, -1]
	#saveValues = [+2, -1, -2, +1]
	killValues = [-2, 4, 4, -2]
	saveValues = [4, -2, -4, 2]
	Dialogic.start("thirla_questions")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		dialog = Dialogic.start("thirla_questions", "thirla_questioning")
