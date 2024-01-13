extends MarginContainer

@export var starting_gold := 1500
@onready var label: Label = $Label
var gold : int:
	set(gold_in):
		gold = max(gold_in, 0)
		label.text = "Gold: {a}".format({"a":gold})

func _ready():
	gold = starting_gold


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
