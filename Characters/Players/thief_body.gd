extends CharacterBody2D

@export var speed = 5000
var pause = false
var left = Vector2(-1,0)
var right = Vector2(1,0)
var up = Vector2(0,-1)
var down = Vector2(0,1)


func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction.x > 0 and input_direction.y > 0:
		rotation_degrees = 135
	elif input_direction.x < 0 and input_direction.y < 0:
		rotation_degrees = 315
	elif input_direction.x < 0 and input_direction.y > 0:
		rotation_degrees = 225
	elif input_direction.x > 0 and input_direction.y < 0:
		rotation_degrees = 45
	elif input_direction == left: 
		rotation_degrees = 270
	elif input_direction == right:
		rotation_degrees = 90
	elif input_direction == down:
		rotation_degrees = 180
	elif input_direction == up:
		rotation_degrees = 0
	velocity = input_direction * speed * delta

func _physics_process(delta):
	if pause == false:
		get_input(delta)
		move_and_slide()


func _on_button_pressed():
	pause = true
	$"../GuardBody/Camera2D".make_current()
	$"../GuardBody".pause = false
