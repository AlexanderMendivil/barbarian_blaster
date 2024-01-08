extends Node3D

@onready var barrel: MeshInstance3D = $TurretBase/CannonBase/Barrel
@export var projectile: PackedScene

var enemy_path: Path3D
func _ready():
	pass
	


func _process(delta):
	pass


func _physics_process(delta):
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)
	
	
func _on_timer_timeout():
	var bullet = projectile.instantiate()
	add_child(bullet)
	bullet.global_position = barrel.global_position
	bullet.direction = global_transform.basis.z

