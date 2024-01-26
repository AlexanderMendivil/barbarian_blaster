extends Area3D


var direction := Vector3.FORWARD
@export var speed := 30.0
@export var damage := 25.0

func _ready() -> void:
	pass

func _physics_process(delta):
	position += (direction * speed) * delta
	


func _on_timer_timeout():
	queue_free()


func _on_area_entered(area:Area3D):
	if area.is_in_group('ENEMY_AREA'):
		area.get_parent().damage(damage)
		queue_free()
