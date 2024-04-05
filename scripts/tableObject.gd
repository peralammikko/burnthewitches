extends Node2D
class_name TableObject

var initialPosition : Vector2
var isOpen = false

@onready var lowerCam = get_node("/root/MainScene/lowerCamPos")
var cameraCenter: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = 1
	scale.y = 1
	cameraCenter = lowerCam.global_position

# If document is not already being dragged, scale it up a bit to highlight
# when mouse hovers over it. Probably could use some color at some point
func _on_area_2d_mouse_entered():
	if !isOpen:
		scale = Vector2(1.05, 1.05)

# When mouse is not hovering over, scale it back to original size.
func _on_area_2d_mouse_exited():
	if !isOpen:
		scale = Vector2(1, 1)

# When right-clicked and document on the table, scale it up to be 'readable'.
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		if not isOpen:
			isOpen = true
			initialPosition = global_position
			print("now in: ", initialPosition)
			#var tween = get_tree().create_tween()
			#tween.tween_property(self, "position", cameraCenter,0.2).set_ease(Tween.EASE_OUT)
			global_position = cameraCenter
			print("move to: ", cameraCenter)
			$Sprite2D.z_index = 10
			scale = Vector2(4,4)
	elif event.is_action_pressed("rightclick"):
		if isOpen:
			isOpen = false
			#var tween = get_tree().create_tween()
			#tween.tween_property(self, "position", initialPosition,0.2).set_ease(Tween.EASE_OUT)
			global_position = initialPosition
			print("move back to: ", initialPosition)
			scale = Vector2(1, 1)
			$Sprite2D.z_index = 1


func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && isOpen:
		print(shape_idx)

func _on_click_areas_mouse_entered():
	if isOpen:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_click_areas_mouse_exited():
	if isOpen:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
