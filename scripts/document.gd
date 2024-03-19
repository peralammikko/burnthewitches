extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPosition : Vector2
var isOpen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	# This is some black magic shit, but basically:
	
	if draggable:
		# Checks if document is marked as 'draggable'
		# If yes, take the initial position before it's getting dragged around
		# Mark document as 'being dragged'
		if Input.is_action_just_pressed("click"):
			initialPosition = global_position
			offset = get_global_mouse_position() - global_position
			globalCheck.is_dragging = true
			
		# This part allows you to drag the object in a way that the 'center point'
		# doesn't magnetize to your mouse pointer's head
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
			
		# If released from dragging, check if it's dropped in an object marked as 'droppable'
		# (basically, the table area). Even if close enough, it drops down there.
		
		# If outside droppable area, create a smooth movement from 
		# the released position back to it's starting (initial) position
		elif Input.is_action_just_released("click"):
			globalCheck.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", global_position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "position", initialPosition,0.2).set_ease(Tween.EASE_OUT)

# If document is not already being dragged, scale it up a bit to highlight
# when mouse hovers over it. Probably could use some color at some point
func _on_area_2d_mouse_entered():
	if not globalCheck.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

# When mouse is not hovering over, scale it back to original size.
func _on_area_2d_mouse_exited():
	if not globalCheck.is_dragging:
		draggable = false
		scale = Vector2(1,1)

# Check if document is inside a body group marked as 'droppable'
# Marks the document so that it could be dropped there.
func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group("droppable"):
		is_inside_droppable = true
		body_ref = body

# When not inside 'droppable', marks it so that it can't be dropped there
func _on_area_2d_body_exited(body):
	if body.is_in_group("droppable"):
		is_inside_droppable = false

# When right-clicked and document on the table, scale it up to be 'readable'.
# TODO: Scaling probably needs to be bigger and document could be centered to screen
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick"):
		if not isOpen:
			isOpen = true
			scale = Vector2(2,2)
		else:
			isOpen = false
			scale = Vector2(1,1)
