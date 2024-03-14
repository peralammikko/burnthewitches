class_name ChoiceButton extends Button
var choice_index: int = -1

signal choice_selected(choice_index)

func _on_pressed():
	choice_selected.emit(choice_index)
