extends Area3D


var direction := Vector3.FORWARD
@export var speed := 30.0
@onready var enemy

func _ready() -> void:
	enemy = get_tree().get_first_node_in_group("ENEMY_AREA")

func _physics_process(delta):
	position += (direction * speed) * delta
	


func _on_timer_timeout():
	queue_free()


func _on_area_entered(area:Area3D):
	if area.is_in_group('ENEMY_AREA'):
		print(enemy)
		queue_free()
		var parent = enemy.get_parent()
		parent.damage(10)
	pass # Replace with function body.
