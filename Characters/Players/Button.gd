extends Button

var camera2d


# Called when the node enters the scene tree for the first time.
func _ready():
	camera2d = get_node("Camera2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	$Thief_body/Camera2D.current = false
