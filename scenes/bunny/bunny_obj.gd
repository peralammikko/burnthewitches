extends TableObject

func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick") && isOpen:
		match shape_idx:
			0:
				Dialogic.start("bunny_objects", "symbol")
			1:
				Dialogic.start("bunny_objects", "rabbit")
			2:
				Dialogic.start("bunny_objects", "egg")
