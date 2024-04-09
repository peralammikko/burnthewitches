extends Area2D

var type_number
var customer_in = false
var customer
var customer_type

@export var thirla: PackedScene
@export var kordon: PackedScene
@export var yra: PackedScene
@export var bunny: PackedScene
@export var athena: PackedScene
@export var provost: PackedScene

var doneCustomers = []
var dayNumber: int = 1

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
		AudioManager.door_open_sound.play()
		match dayNumber:
			1:
				customer = provost.instantiate()
			2: 
				customer = kordon.instantiate()
			3:
				customer = yra.instantiate()
		add_child(customer)
		customer_in = true

# Removes NPC from screen with no further logic yet.
# Sets customer_in back to 'false' to enable spawning a new customer in
# Spawn timer adds a small delay before new customer 'pops in' 
func remove_customer():
	remove_child(customer)
	customer_in = false
	if dayNumber >= 3:
		dayNumber = 1
	else:
		dayNumber += 1

# After timer ends, spawns a new customer to screen
func _on_spawn_timer_timeout():
	pass
