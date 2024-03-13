extends Node2D

@onready var choice_button_scene = preload("res://scenes/ChoiceButton.tscn")

var choice_buttons: Array[Button] = []

func clear_dialogue_box():
	$VBoxContainer/Text.text = ""
	for choice in choice_buttons:
		$VBoxContainer.remove_child(choice)
		# queue_free()
	choice_buttons = []

func _ready():
	pass

func add_text(text: String):
	$VBoxContainer/Text.text  = text
	pass
	
func add_choice(choice_text: String):
	var button_obj: ChoiceButton = choice_button_scene.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(button_obj)
	
func _on_choice_selected(choice_index: int):
	print(choice_index)
	($"../EzDialogue" as EzDialogue).next(choice_index)
	pass
