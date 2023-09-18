extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			if(position.z + 10 <= -300): position.z += 5
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			if(position.z - 10 >= -400): position.z -= 5
	transform.basis = Basis() # reset rotation
	var cam_zoom = -(-400 - position.z)
	var cam_angle = (cam_zoom / 180) * PI/2
	var camera_displacement = tan(cam_angle) * (cam_zoom - 100)
	position.y = camera_displacement
	rotate_object_local(Vector3(0, 1, 0), PI)
	rotate_object_local(Vector3(1, 0, 0), cam_angle)
