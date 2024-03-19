extends Node2D

@onready var spawner = get_node("/root/MainScene/Spawner")

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
	current_customer_type = spawner.customer_type

# When customer is saved, adds value to "this-customer-type saved" variable for end screen.
func _on_pass_button_pressed():
	match current_customer_type:
		"villager":
			villagers_saved += 1
		"goodwitch":
			good_witches_saved += 1
		"badwitch":
			bad_witches_saved += 1
	spawner.remove_customer()
	
# When customer is killed, adds value to "this-customer-type killed" variable for end screen.
func _on_burn_button_pressed():
	match current_customer_type:
		"villager":
			villagers_killed += 1
		"goodwitch":
			good_witches_killed += 1
		"badwitch":
			bad_witches_killed += 1
	spawner.remove_customer()
