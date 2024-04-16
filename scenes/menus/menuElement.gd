extends Control
class_name MenuElement

@export var exportText: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$buttonLabel.hide()
	$buttonLabel.text = exportText
	
func _on_button_mouse_entered():
	print("cursor point")
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	$buttonLabel.show()
	
func _on_button_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	$buttonLabel.hide()

func _on_button_pressed():
	pass # Replace with function body.
