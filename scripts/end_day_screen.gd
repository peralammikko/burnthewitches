extends Control

var stats = globalStats.alignStats

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func display_stats():
	var highestAlign = getHighest()
	print("Highest: ", highestAlign)
	$witches_killed.text = "Order: " + str(stats["order"]) + " / Rebel: " + str(stats["rebel"]) + " / Good: " + str(stats["good"]) + " / Evil: " + str(stats["evil"])
	$innocents_saved.text = "Highest stat: " + str(highestAlign)

func _on_continue_button_pressed():
	get_tree().reload_current_scene()

func getHighest():
	var valueArr = []
	for stat in globalStats.alignStats:
		valueArr.push_back(globalStats.alignStats[stat])
	return valueArr.max()
