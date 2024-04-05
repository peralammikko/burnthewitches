extends Sprite2D

@onready var mood_calm = load("res://styles/moodflames/mood_calm.tres")
@onready var mood_angry = load("res://styles/moodflames/mood_angry.tres")
@onready var mood_scared = load("res://styles/moodflames/mood_scared.tres")
@onready var flameColor = $MoodFlame.process_material.color_ramp.gradient

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	setFlameColor(mood_calm)

func _on_dialogic_signal(argument: String):
	if argument == "mood_angry":
		setFlameColor(mood_angry)
	elif argument == "mood_calm":
		setFlameColor(mood_calm)
	elif argument == "mood_scared":
		setFlameColor(mood_scared)

func setFlameColor(newMood):
	$MoodFlame.process_material.set("color_ramp", newMood)
