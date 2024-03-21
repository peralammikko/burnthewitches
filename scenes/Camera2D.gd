extends Camera2D

@onready var low_camera = get_node("../lowerCamPos")

var upper_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	upper_position = global_position
	$Camera_up_button.hide()


# Called every frame.
# If player pushes 'down' or 's', camera moves down.
# If player pushes 'up' or 'w', camera moves up.
func _process(delta):
	if Input.is_action_just_pressed("down"):
		_on_camera_down_button_pressed()
	elif Input.is_action_just_pressed("up"):
		_on_camera_up_button_pressed()

# Smooth camera scrolling down
func _on_camera_down_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", low_camera.global_position, 0.2).set_ease(Tween.EASE_OUT)
	$Camera_down_button.hide()
	$Camera_up_button.show()
	if Dialogic.Text.is_textbox_visible():
		Dialogic.Save.save("",false,Dialogic.Save.ThumbnailMode.NONE)
		Dialogic.end_timeline()

# Smooth camera scrolling up
func _on_camera_up_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", upper_position, 0.2).set_ease(Tween.EASE_OUT)
	$Camera_up_button.hide()
	$Camera_down_button.show()
	if Dialogic.Save.has_slot("Default"):
		Dialogic.Save.load()
	
	
