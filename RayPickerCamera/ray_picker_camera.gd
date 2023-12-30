extends Camera3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _process(_delta: float) -> void:
	var mouse_position:Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap && Input.is_action_just_pressed('click'):
			print("click")
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = collider.local_to_map(collision_point)
			if  collider.get_cell_item(cell) == 0:
				collider.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
