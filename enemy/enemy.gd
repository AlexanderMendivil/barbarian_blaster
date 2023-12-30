extends PathFollow3D

@export var speed: float = 2.5

@onready var base
func _ready() -> void:
	base = get_tree().get_first_node_in_group("BASE")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += (delta * speed)
	if progress_ratio == 1:
		base.take_damage()
		set_process(false)
	pass
