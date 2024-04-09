extends Node2D

@onready var spawner = get_node("/root/MainScene/Spawner")
@onready var animationplayer = get_node("/root/MainScene/Door/AnimationPlayer")

var customer_count: int
var current_customer_type

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func end_day():
	animationplayer.play("TransitionOut")
	var customerNode = get_tree().get_first_node_in_group("customer")
	addTotalStats(customerNode.killValues)
	customer_count += 1
	spawner.remove_customer()

# When customer is saved, adds value to "this-customer-type saved" variable for end screen.
func _on_pass_button_pressed():
	if spawner.customer_in == false:
		print("no customer")
		pass
	else:
		end_day()
	
# When customer is killed, adds value to "this-customer-type killed" variable for end screen.
func _on_burn_button_pressed():
	if spawner.customer_in == false:
		print("no customer")
		pass
	else:
		end_day()
		
func addTotalStats(valueArray):
	globalStats.alignStats["order"] += valueArray[0]
	globalStats.alignStats["rebel"] += valueArray[1]
	globalStats.alignStats["good"]+= valueArray[2]
	globalStats.alignStats["evil"] += valueArray[3]
	
