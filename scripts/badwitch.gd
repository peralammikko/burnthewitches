extends Area2D

@export var badwitchdialogue: JSON

# Called when the node enters the scene tree for the first time.
func _ready():
	$DialogueBox.hide()
	Dialogic.Save.delete_slot("Default")
	var texture_index = randi_range(1,3)
	match texture_index:
		1:
			$Sprite2D.texture = load("res://assets/customers/Tw3_journal_brewess.webp")
		2:
			$Sprite2D.texture = load("res://assets/customers/Tw3_journal_whispess.webp")
		3:
			$Sprite2D.texture = load("res://assets/customers/Tw3_journal_weavess.webp")
			
	#$DialogueBox.create_new_dialogue(badwitchdialogue)
	Dialogic.start("suspect_3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
