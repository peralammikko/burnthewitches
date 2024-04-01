extends Area2D

var type_number
var customer_in = false
var customer
var customer_type

@export var villager: PackedScene
@export var goodwitch: PackedScene
@export var badwitch: PackedScene

# Called when the node enters the scene tree for the first time.
# Spawns a new customer and generates dialogue.
func _ready():
	spawn_new_customer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Currently randoms customer type with 3 possible choices.
func spawn_new_customer():
	if !customer_in:
		type_number = 2;
		#type_number = randi_range(1,3)
		match type_number:
			1: 
				customer_type = "villager"
				customer = villager.instantiate()
			2: 
				customer_type = "goodwitch"
				customer = goodwitch.instantiate()
			3:
				customer_type = "badwitch"
				customer = badwitch.instantiate()
					
		add_child(customer)
		customer_in = true

# Removes NPC from screen with no further logic yet.
# Sets customer_in back to 'false' to enable spawning a new customer in
# Spawn timer adds a small delay before new customer 'pops in' 
func remove_customer():
	remove_child(customer)
	customer_in = false

# After timer ends, spawns a new customer to screen
func _on_spawn_timer_timeout():
	pass
