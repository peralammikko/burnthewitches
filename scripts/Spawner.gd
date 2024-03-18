extends Area2D

var type_number
var customer_in = false
var customer

@export var villager: PackedScene
@export var goodwitch: PackedScene
@export var badwitch: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_new_customer()
	generate_dialogue()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func spawn_new_customer():
	type_number = randi_range(1,3)
	match type_number:
		1: 
			customer = villager.instantiate()
		2: 
			customer = goodwitch.instantiate()
		3:
			customer = badwitch.instantiate()
				
	add_child(customer)
	customer_in = true

func generate_dialogue():
	pass

func remove_customer():
	remove_child(customer)
	customer_in = false
	$SpawnTimer.start()


func _on_spawn_timer_timeout():
	if not customer_in:
		spawn_new_customer()
