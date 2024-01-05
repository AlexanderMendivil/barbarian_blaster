extends Node3D


@export var projectile: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	var bullet = projectile.instantiate()
	bullet.position = position
	add_child(bullet)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
