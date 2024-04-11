extends MenuElement

@onready var creditsText = get_node("/root/MainMenu/credits")

var creditsShown = false

func _on_button_pressed():
	if creditsShown:
		creditsText.hide()
		creditsShown = false
	else:
		creditsText.show()
		creditsShown = true
