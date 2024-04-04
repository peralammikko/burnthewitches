extends Control

var stats = globalStats.alignStats
var endQuotes

# Called when the node enters the scene tree for the first time.
func _ready():
	openJson()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func openJson():
	var file = "res://assets/dialogue/endDayText.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	if json_as_dict:
		endQuotes = json_as_dict
	
func display_stats():
	var dailyText = getEndQuote()
	$witches_killed.text = "Order: " + str(stats["order"]) + " / Rebel: " + str(stats["rebel"]) + " / Good: " + str(stats["good"]) + " / Evil: " + str(stats["evil"])
	$flavor_text.text = str(dailyText)

func _on_continue_button_pressed():
	hide()

func getHighest():
	var valueArr = []
	for stat in globalStats.alignStats:
		valueArr.push_back(globalStats.alignStats[stat])
	var topStat = valueArr.max()
	return topStat
	
func getEndQuote():
	var quote: String = "The Empire may yet survive."
	var statValue: int = getHighest()
	var alignmentType: String = stats.find_key(statValue)
	var statLevel: int = getStatLevel(statValue)
	match alignmentType:
		"order":
			quote = endQuotes["order"][statLevel]
		"rebel":
			quote = endQuotes["rebel"][statLevel]
		"good":
			quote = endQuotes["good"][statLevel]
		"evil":
			quote = endQuotes["evil"][statLevel]
	return quote
	
func getStatLevel(value):
	var statLevel: int = 0
	if (value >= 1 && value <= 3):
		statLevel = 1
	elif (value >= 4 && value <= 6):
		statLevel = 2
	elif (value >= 7 && value <= 9):
		statLevel = 3
	elif (value >= 10):
		statLevel = 4
	return statLevel
