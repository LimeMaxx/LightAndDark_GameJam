extends CharacterBody2D

@export var speed = 5000
var pause = true
var left = Vector2(-1,0)
var right = Vector2(1,0)
var up = Vector2(0,-1)
var down = Vector2(0,1)

var duck_one = 0

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
	
	#var input_action = Input.action_("spawn_duck")
	
	
	if duck_one == 0:
		if Input.is_action_pressed("spawn_duck"):
			print("Space Key is pressed!")
			const DUCK = preload("res://Items/duck/duck.tscn")
			print("duck is preloaded")
			var new_duck = DUCK.instantiate()
			print("duck is instantiated")
			$".".get_parent().add_child(new_duck)
			new_duck.global_position = $".".global_position
			print("duck is spawned")
			new_duck.rotation_degrees = $".".rotation_degrees
			if $".".rotation_degrees == 0:
				new_duck.direction = up
			elif $".".rotation_degrees == 90:
				new_duck.direction = right
			elif $".".rotation_degrees == -180:
				new_duck.direction = down
			elif $".".rotation_degrees == -90:
				new_duck.direction = left
			duck_one = 1
	

func _physics_process(delta):
	if pause == false:
		get_input(delta)
		move_and_slide()
		print(rotation_degrees)

func _on_button_2_pressed():
	pause = true
	$"../Thief_body/Camera2D".make_current()
	$"../Thief_body".pause = false
