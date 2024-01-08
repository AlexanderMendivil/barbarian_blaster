extends Area3D


var direction := Vector3.FORWARD
@export var speed := 30.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += (direction * speed) * delta
	


func _on_timer_timeout():
	queue_free()
