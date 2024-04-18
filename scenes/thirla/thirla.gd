extends BaseNPC

func _ready():
	killValues = [0, 3, 3, 0]
	saveValues = [5, 0, -2, +5]
	Dialogic.start("thirla_questions")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && globalStats.isCameraUp:
		checkClues()
		dialog = Dialogic.start("thirla_questions", "thirla_questioning")

func checkClues():
	if Dialogic.VAR.Thirla.eyesFound == true && Dialogic.VAR.Thirla.mechajoustFound == true && Dialogic.VAR.Thirla.lumisFound == true:
		Dialogic.VAR.Thirla.allCluesFound = true
