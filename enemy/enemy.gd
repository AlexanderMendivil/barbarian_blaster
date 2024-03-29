extends PathFollow3D

@onready var base
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank := get_tree().get_first_node_in_group("BANK")

@export var max_health := 50
@export var speed: float = 2.5
@export var max_gold_earned := 15 
var current_health: int:
	set(health_in):
		if health_in < current_health:
			animation_player.play('TakeDamage')

		current_health = health_in
		if current_health < 1:
			bank.gold += max_gold_earned
			queue_free()

func _ready() -> void:
	base = get_tree().get_first_node_in_group("BASE")
	current_health = max_health


func _process(delta: float) -> void:
	progress += (delta * speed)
	if progress_ratio == 1:
		base.take_damage()
		set_process(false)
		queue_free()
	pass

func damage(damage_hit: int) -> void:
	current_health -= damage_hit
	
