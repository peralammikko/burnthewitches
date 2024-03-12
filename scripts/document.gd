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
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPosition = global_position
			offset = get_global_mouse_position() - global_position
			globalCheck.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			globalCheck.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", global_position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "position", initialPosition,0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_mouse_entered():
	if not globalCheck.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	if not globalCheck.is_dragging:
		draggable = false
		scale = Vector2(1,1)


func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group("droppable"):
		#print_debug("in droppable")
		is_inside_droppable = true
		body_ref = body


func _on_area_2d_body_exited(body):
	if body.is_in_group("droppable"):
		#print_debug("out of droppable")
		is_inside_droppable = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("rightclick"):
		if not isOpen:
			#print_debug("opening")
			isOpen = true
			scale = Vector2(2,2)
		else:
			#print_debug("closing")
			isOpen = false
			scale = Vector2(1,1)
