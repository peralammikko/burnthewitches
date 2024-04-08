extends BaseNPC

# Called when the node enters the scene tree for the first time.
func _ready():
	killValues = [-1, +2, +2, -1]
	saveValues = [+2, -1, -2, +1]
	Dialogic.start("Bunny")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		dialog = Dialogic.start("Bunny", "bunny_questions")
