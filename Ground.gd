extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# New York :)
var lat = 40.71427
var lon = -74.00597

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var new_lat = lat - (input_dir.y / 10)
	lon = lon + (input_dir.x / 10)
	if lon < -180:
		lon += 360
	if lon > 180:
		lon -= 360
	if(new_lat <= 90 && new_lat >= -90):
		lat = new_lat
	var lon_rads = (lon / 90) * -PI/2
	var lat_rads = (lat / 90) * -PI/2
	transform.basis = Basis() # reset rotation
	rotate_object_local(Vector3(0, 1, 0), lon_rads) # first rotate in Y
	rotate_object_local(Vector3(cos(lon_rads), 0, sin(lon_rads)), lat_rads)
	print(lon)
