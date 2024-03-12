extends Node2D

@onready var spawner = get_node("/root/MainScene/Spawner")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pass_button_pressed():
	print_debug(spawner.remove_customer())

func _on_burn_button_pressed():
	print_debug(spawner.remove_customer())
