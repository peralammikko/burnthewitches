extends Node2D

@onready var spawner = get_node("/root/MainScene/Spawner")
@onready var end_screen = get_node("/root/MainScene/CanvasLayer/end_day_screen")

var customer_count: int

var good_witches_killed: int
var good_witches_saved: int

var bad_witches_killed: int
var bad_witches_saved: int

var villagers_killed: int
var villagers_saved: int

var current_customer_type

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if customer_count > 5:
		end_screen.show()
		end_screen.display_stats(bad_witches_killed, good_witches_saved)

# When customer is saved, adds value to "this-customer-type saved" variable for end screen.
func _on_pass_button_pressed():
	current_customer_type = spawner.customer_type
	match current_customer_type:
		"villager":
			villagers_saved += 1
		"goodwitch":
			good_witches_saved += 1
		"badwitch":
			bad_witches_saved += 1
	customer_count += 1
	spawner.remove_customer()
	
# When customer is killed, adds value to "this-customer-type killed" variable for end screen.
func _on_burn_button_pressed():
	current_customer_type = spawner.customer_type
	match current_customer_type:
		"villager":
			villagers_killed += 1
		"goodwitch":
			good_witches_killed += 1
		"badwitch":
			bad_witches_killed += 1
	customer_count += 1
	spawner.remove_customer()
