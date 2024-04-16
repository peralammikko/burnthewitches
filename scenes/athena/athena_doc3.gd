extends TableObject

func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick") && openObject == self:
		match shape_idx:
			0:
				Dialogic.start("athena_objects", "accusations2")
			1:
				Dialogic.start("athena_objects", "coven")
