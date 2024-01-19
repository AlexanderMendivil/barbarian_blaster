extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node
@onready var timer:Timer = $Timer
func _ready():
	pass

func _process(_delta):
	pass


func spawn_enemies():
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = difficulty_manager.get_health_increase()
	add_child(new_enemy)
	timer.wait_time = difficulty_manager.get_spwan_time()


func _on_difficulty_manager_stop_spawning_enemies():
	timer.stop()
