extends Area2D

@export var goodwitchdialogue: JSON

# Called when the node enters the scene tree for the first time.
# For now, it randoms one of three sprites for a 'good witch'
func _ready():
	$DialogueBox.hide()
	var texture_index = randi_range(1,3)
	match texture_index:
		1:
			$Sprite2D.texture = load("res://assets/customers/Tw3_journal_triss.webp")
		2:
			$Sprite2D.texture = load("res://assets/customers/Tw3_journal_yennefer.webp")
		3:
			$Sprite2D.texture = load("res://assets/customers/Tw3_journal_philippa.webp")
			
	#$DialogueBox.create_new_dialogue(goodwitchdialogue)
	var dialog = Dialogic.start("thirla_questions")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
