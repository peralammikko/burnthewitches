extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func display_stats(bads_killed, goods_saved):
	$witches_killed.text = "Maleficants Executed " + str(bads_killed)
	$innocents_saved.text = "Guiltless Absolved " + str(goods_saved)


func _on_continue_button_pressed():
	get_tree().reload_current_scene()
