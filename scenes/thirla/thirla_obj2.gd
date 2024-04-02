extends TableObject

func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && isOpen:
		print(shape_idx)
		match shape_idx:
			0:
				Dialogic.start("thirla_obj1", "smile")
			1:
				Dialogic.start("thirla_obj1", "eyes")
				Dialogic.VAR.Thirla.EyesFound = true;
				print("EYES: ", Dialogic.VAR.Thirla.EyesFound)
