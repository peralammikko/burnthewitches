extends TableObject

func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick") && openObject == self:
		match shape_idx:
			0:
				Dialogic.start("provost_objects", "books")
			1:
				Dialogic.start("provost_objects", "text")
			2:
				Dialogic.start("provost_objects", "binding")
