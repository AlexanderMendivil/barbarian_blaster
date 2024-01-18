extends Node

@onready var timer = $Timer

@export var game_length := 30.0
@export var spawn_time_curve: Curve

func _ready():
	timer.start(game_length)


func _process(_delta):
	print(get_spwan_time())

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_length)

func get_spwan_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())