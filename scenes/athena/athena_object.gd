extends TableObject

func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick") && isOpen:
		match shape_idx:
			0:
				Dialogic.start("athena_objects", "weapon")
			1:
				Dialogic.start("athena_objects", "muzzle")
