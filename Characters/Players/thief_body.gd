extends CharacterBody2D

@export var speed = 5000
var pause = false

func get_input(delta):
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed * delta

func _physics_process(delta):
	if pause == false:
		get_input(delta)
		move_and_slide()


func _on_button_pressed():
	pause = true
	$"../GuardBody/Camera2D".make_current()
	$"../GuardBody".pause = false
