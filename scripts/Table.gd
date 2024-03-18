extends Node2D

@onready var spawner = get_node("/root/MainScene/Spawner")

var good_witches_killed
var bad_witches_killed
var current_customer_type

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_customer_type = spawner.customer_type


func _on_pass_button_pressed():
	if current_customer_type == "villager":
		print("villager saved")
	elif current_customer_type == "goodwitch":
		print("good witch saved")
	else:
		print("bad witch saved")
	spawner.remove_customer()
	

func _on_burn_button_pressed():
	if current_customer_type == "villager":
		print("villager killed")
	elif current_customer_type == "goodwitch":
		print("good witch killed")
	else:
		print("bad witch killed")
	spawner.remove_customer()
