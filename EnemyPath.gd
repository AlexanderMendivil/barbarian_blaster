extends Path3D

@export var enemy_scene: PackedScene

func _ready():
	pass

func _process(delta):
	pass


func spawn_enemies():
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)
