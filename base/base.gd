extends Node3D

@export var max_health: int = 5
@onready var label_3d: Label3D = $Label3D

func _ready() -> void:
	label_3d.text = str(max_health)

func _process(_delta: float) -> void:
	pass


func take_damage() -> void:
	if max_health != 0:
		max_health -= 1 
		label_3d.text = str(max_health)
