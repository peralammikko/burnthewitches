extends Node2D
class_name TableObject

var initialPosition : Vector2
var isOpen = false
var initScale: Vector2

@onready var lowerCam = get_node("/root/MainScene/lowerCamPos")
var cameraCenter: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	initScale = scale
	cameraCenter = lowerCam.global_position

# If document is not already being dragged, scale it up a bit to highlight
# when mouse hovers over it. Probably could use some color at some point
func _on_area_2d_mouse_entered():
	if !isOpen:
		scale = Vector2(1.05*initScale.x, 1.05*initScale.y)

# When mouse is not hovering over, scale it back to original size.
func _on_area_2d_mouse_exited():
	if !isOpen:
		scale = initScale

# When right-clicked and document on the table, scale it up to be 'readable'.
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		if not isOpen:
			$ColorRect.show()
			$ClickAreas.show()
			AudioManager.paper_sound.play()
			isOpen = true
			initialPosition = global_position
			#var tween = get_tree().create_tween()
			#tween.tween_property(self, "position", cameraCenter,0.2).set_ease(Tween.EASE_OUT)
			global_position = cameraCenter
			z_index = 10
			scale = Vector2(4*initScale.x,4*initScale.y)
			
		else:
			$ColorRect.hide()
			$ClickAreas.hide()
			AudioManager.paper_close_sound.play()
			isOpen = false
			#var tween = get_tree().create_tween()
			#tween.tween_property(self, "position", initialPosition,0.2).set_ease(Tween.EASE_OUT)
			global_position = initialPosition
			scale = initScale
			z_index = 1

func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick") && isOpen:
		print(shape_idx)

func _on_click_areas_mouse_entered():
	if isOpen:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_click_areas_mouse_exited():
	if isOpen:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
