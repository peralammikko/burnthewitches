extends BaseNPC

# Called when the node enters the scene tree for the first time.
func _ready():
	killValues = [-1, +2, +2, -1]
	saveValues = [+2, -1, -2, +1]
	Dialogic.start("Bunny")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
