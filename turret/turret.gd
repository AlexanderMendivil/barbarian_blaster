extends Node3D

@onready var barrel: MeshInstance3D = $TurretBase/CannonBase/Barrel
@export var projectile: PackedScene
func _ready():
	pass
	


func _process(delta):
	pass


func _on_timer_timeout():
	var bullet = projectile.instantiate()
	add_child(bullet)
	bullet.global_position = barrel.global_position
