extends PathFollow3D

@export var speed: float = 2.5
@export var max_health := 50
@onready var base

var current_health: int:
	set(health_in):
		current_health = health_in
		if current_health < 1:
			queue_free()

func _ready() -> void:
	base = get_tree().get_first_node_in_group("BASE")
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += (delta * speed)
	if progress_ratio == 1:
		base.take_damage()
		set_process(false)
	pass

func damage(damage_hit: int) -> void:
	current_health -= damage_hit
	
