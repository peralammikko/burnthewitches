extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPosition : Vector2
var isOpen = false

@onready var lowerCam = get_node("/root/MainScene/lowerCamPos")
var cameraCenter: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = 0.6
	scale.y = 0.6
	cameraCenter = lowerCam.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# This is some black magic shit, but basically:
	pass

# If document is not already being dragged, scale it up a bit to highlight
# when mouse hovers over it. Probably could use some color at some point
func _on_area_2d_mouse_entered():
	if !isOpen:
		scale = Vector2(0.65, 0.65)

# When mouse is not hovering over, scale it back to original size.
func _on_area_2d_mouse_exited():
	if !isOpen:
		scale = Vector2(0.6, 0.6)

# When right-clicked and document on the table, scale it up to be 'readable'.
# TODO: Scaling probably needs to be bigger and document could be centered to screen
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		if not isOpen:
			initialPosition = global_position
			var tween = get_tree().create_tween()
			tween.tween_property(self, "position", cameraCenter,0.2).set_ease(Tween.EASE_OUT)
			isOpen = true
			scale = Vector2(1.8,1.8)
		else:
			isOpen = false
			var tween = get_tree().create_tween()
			tween.tween_property(self, "position", initialPosition,0.2).set_ease(Tween.EASE_OUT)
			scale = Vector2(0.6, 0.6)
