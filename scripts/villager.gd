extends Area2D

@export var villagerdialogue: JSON

# Called when the node enters the scene tree for the first time.
func _ready():
	#$DialogueBox.create_new_dialogue(villagerdialogue)
	Dialogic.start("kordon_intro")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
