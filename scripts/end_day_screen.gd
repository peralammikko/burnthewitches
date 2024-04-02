extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func display_stats(bads_killed, goods_saved):
	$witches_killed.text = "Order: " + str(globalStats.alignStats["order"])
	$innocents_saved.text = "Rebel: " + str(globalStats.alignStats["rebel"])

func _on_continue_button_pressed():
	get_tree().reload_current_scene()

func getHighest():
	print(globalStats.alignStats)
