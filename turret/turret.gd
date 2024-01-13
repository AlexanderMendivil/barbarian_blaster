extends Node3D

@onready var barrel: MeshInstance3D = $TurretBase/CannonBase/Barrel
@export var projectile: PackedScene
@export var turret_range := 10.0
@onready var animation_player: AnimationPlayer =$TurretBase/CannonBase/Barrel/AnimationPlayer
var enemy_path: Path3D
var global_enemy: PathFollow3D
func _ready():
	pass
	

func _process(_delta):
	pass


func _physics_process(_delta):
	global_enemy = find_best_target()
	if global_enemy:
		look_at(global_enemy.global_position, Vector3.UP, true)

	
	
func _on_timer_timeout():
	if global_enemy:
		var bullet = projectile.instantiate()
		animation_player.play("recoil")
		add_child(bullet)
		bullet.global_position = barrel.global_position
		bullet.direction = global_transform.basis.z

func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			if enemy.progress > best_progress && global_position.distance_to(enemy.global_position) < turret_range:
				best_target = enemy
				best_progress = enemy.progress
	return best_target
