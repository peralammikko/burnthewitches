extends Area2D

var hintFound = false;
var dialog

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	Dialogic.Save.delete_slot("Default")
	$Sprite2D.texture = load("res://assets/customers/Tw3_journal_triss.webp")
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		dialog = Dialogic.start("thirla_questions", "thirla_questioning")
		
