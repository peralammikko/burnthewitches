extends Camera2D

@onready var low_camera = get_node("../lowerCamPos")
var upper_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	upper_position = global_position
	$Camera_up_button.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("down"):
		_on_camera_down_button_pressed()
	elif Input.is_action_just_pressed("up"):
		_on_camera_up_button_pressed()


func _on_camera_down_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", low_camera.global_position, 0.2).set_ease(Tween.EASE_OUT)
	$Camera_down_button.hide()
	$Camera_up_button.show()


func _on_camera_up_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", upper_position, 0.2).set_ease(Tween.EASE_OUT)
	$Camera_up_button.hide()
	$Camera_down_button.show()
	
	
