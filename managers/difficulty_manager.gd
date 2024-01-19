extends Node

signal stop_spawning_enemies

@onready var timer = $Timer

@export var game_length := 30.0
@export var spawn_time_curve: Curve
@export var health_increase_curve: Curve

func _ready():
	timer.start(game_length)

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_length)

func get_spwan_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())

func get_health_increase() -> float:
	return health_increase_curve.sample(game_progress_ratio())

func _on_timer_timeout():
	stop_spawning_enemies.emit()
