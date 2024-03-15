extends Node2D


@export var dialogue_json: JSON
@onready var state = {}

@onready var choice_button_scene = preload("res://scenes/ChoiceButton.tscn")
@onready var dialogue_handler: EzDialogue = $EzDialogue

var choice_buttons: Array[Button] = []
var dialogue_finished = false

func _ready():
	dialogue_handler.start_dialogue(dialogue_json, state)
	pass


func clear_dialogue_box():
	$VBoxContainer/Text.text = ""
	for choice in choice_buttons:
		$VBoxContainer.remove_child(choice)
		choice.queue_free()
	choice_buttons = []

func add_text(text: String):
	$VBoxContainer/Text.text  = text
	
func add_choice(choice_text: String):
	var button_obj: ChoiceButton = choice_button_scene.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(button_obj)
	
func _on_choice_selected(choice_index: int):
	if !dialogue_finished:
		dialogue_handler.next(choice_index)
	else:
		clear_dialogue_box()


func _on_ez_dialogue_dialogue_generated(response):
	clear_dialogue_box()
	
	add_text(response.text)
	if response.choices.is_empty():
		add_choice("...")
	else:
		for choice in response.choices:
			add_choice(choice)


func _on_ez_dialogue_end_of_dialogue_reached():
	dialogue_finished = true

