extends Area2D

var dialog

@export var npcValues: JSON

#var killValues = [-1, +2, +2, -1]
#var saveValues = [+2, -1, -2, +1]

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	$Sprite2D.texture = load("res://assets/customers/Tw3_journal_triss.webp")
	Dialogic.start("thirla_questions")
	print(npcValues)
	
	#var texture_index = randi_range(1,3)
	#match texture_index:
	#	1:
	#		$Sprite2D.texture = load("res://assets/customers/Tw3_journal_triss.webp")
	#	2:
	#		$Sprite2D.texture = load("res://assets/customers/Tw3_journal_yennefer.webp")
	#	3:
	#		$Sprite2D.texture = load("res://assets/customers/Tw3_journal_philippa.webp")
	#		
	#$DialogueBox.create_new_dialogue(goodwitchdialogue)

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		dialog = Dialogic.start("thirla_questions", "thirla_questioning")
		

func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
