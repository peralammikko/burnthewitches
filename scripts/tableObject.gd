extends Node2D
class_name TableObject

var initialPosition : Vector2
var isOpen = false
var initScale: Vector2

@onready var lowerCam = get_node("/root/MainScene/lowerCamPos")
var cameraCenter: Vector2

var openObject = globalStats.selectedObject

# Called when the node enters the scene tree for the first time.
func _ready():
	initScale = scale
	cameraCenter = lowerCam.global_position

# If document is not already being dragged, scale it up a bit to highlight
# when mouse hovers over it. Probably could use some color at some point
func _on_area_2d_mouse_entered():
	if openObject != self:
		scale = Vector2(1.05*initScale.x, 1.05*initScale.y)

# When mouse is not hovering over, scale it back to original size.
func _on_area_2d_mouse_exited():
	if openObject != self:
		scale = initScale

# When right-clicked and document on the table, scale it up to be 'readable'.
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick") && openObject == null:
		openObject = self
		print("Open now: ", openObject)
		$ColorRect.show()
		$ClickAreas.show()
		AudioManager.paper_sound.play()
		initialPosition = global_position
		global_position = cameraCenter
		z_index = 10
		scale = Vector2(4*initScale.x,4*initScale.y)
		openObject = self
		globalStats.isInspecting = true
		
	elif event.is_action_pressed("leftclick") && openObject == self:
		openObject = null
		print("Hiding things")
		$ColorRect.hide()
		$ClickAreas.hide()
		AudioManager.paper_close_sound.play()
		global_position = initialPosition
		scale = initScale
		z_index = 1
		globalStats.isInspecting = false
	
func _on_click_areas_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick") && openObject == self:
		print(shape_idx)

func _on_click_areas_mouse_entered():
	if globalStats.isInspecting:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_click_areas_mouse_exited():
	if globalStats.isInspecting:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
