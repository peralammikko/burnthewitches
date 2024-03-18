extends Node2D

@onready var spawner = get_node("/root/MainScene/Spawner")

# Called when the node enters the scene tree for the first time.
func _ready():
	$downButton.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pass_button_pressed():
	spawner.remove_customer()

func _on_burn_button_pressed():
	spawner.remove_customer()


func _on_down_button_pressed():
	position.y += 200
	$downButton.hide()
	$upButton.show()

func _on_up_button_pressed():
	position.y -= 200
	$upButton.hide()
	$downButton.show()
