extends Node3D

@export var max_health: int = 5

@onready var label_3d: Label3D = $Label3D

var currentHealth: int:
	set(health_in):
		currentHealth = health_in
		label_3d.text = str(currentHealth) + "/" + str(max_health)
		var red: Color = Color.RED
		var white: Color = Color.WHITE
		label_3d.modulate = red.lerp(white, float(currentHealth) / float(max_health))
		if currentHealth < 1:
			get_tree().reload_current_scene()

func _ready() -> void:
	currentHealth = max_health

func _process(_delta: float) -> void:
	pass


func take_damage() -> void:
	if max_health != 0:
		currentHealth -= 1 
