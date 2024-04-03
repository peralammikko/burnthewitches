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
	pass

func check_end_day():
	if customer_count == 3:
		end_day()

func end_day():
	end_screen.show()
	end_screen.display_stats()

# When customer is saved, adds value to "this-customer-type saved" variable for end screen.
func _on_pass_button_pressed():
	if spawner.customer_in == false:
		print("no customer")
		pass
	else:
		var customerNode = get_tree().get_first_node_in_group("customer")
		addTotalStats(customerNode.saveValues)
		customer_count += 1
		spawner.remove_customer()
	check_end_day()
	
# When customer is killed, adds value to "this-customer-type killed" variable for end screen.
func _on_burn_button_pressed():
	if spawner.customer_in == false:
		print("no customer")
		pass
	else:
		var customerNode = get_tree().get_first_node_in_group("customer")
		addTotalStats(customerNode.killValues)
		customer_count += 1
		spawner.remove_customer()
	check_end_day()
		
func addTotalStats(valueArray):
	globalStats.alignStats["order"] += valueArray[0]
	globalStats.alignStats["rebel"] += valueArray[1]
	globalStats.alignStats["good"]+= valueArray[2]
	globalStats.alignStats["evil"] += valueArray[3]
	
