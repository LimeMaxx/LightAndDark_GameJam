extends CharacterBody2D

@export var speed = 5000
var pause = false
var dash_one = 0
var can_dash = 0
var can_knife_throw = 0
var throwing_knife_one = 0
var left = Vector2(-1,0)
var right = Vector2(1,0)
var up = Vector2(0,-1)
var down = Vector2(0,1)

#setup animation
@onready var anim: AnimatedSprite2D = $animated_thief

func get_input(delta):
	const DASH = preload("res://Items/Dash/DashItem.tscn")
	const KNIFE_ITEM = preload("res://Items/Throwing Dagger/knife_item.tscn")
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
	
	#ANIMATION
	if input_direction != Vector2(0, 0):
		anim.play("walking")
	else:
		anim.play("transition")
		anim.set_frame_and_progress(0, 0)
	#ANIMATION
	
	if can_dash == 1:
		if dash_one == 0:
			if Input.is_action_pressed("Ability_1"):
				speed = 20000
				dash_one = 1
				$Timer.start()
	
	if can_knife_throw == 1:
		if throwing_knife_one == 0:
			if speed != TYPE_NIL:
				if Input.is_action_pressed("Ability_2"):
					const KNIFE = preload("res://Items/Throwing Dagger/throwing_dagger.tscn")
					var new_knife = KNIFE.instantiate()
					$".".get_parent().add_child(new_knife)
					new_knife.global_position = $".".global_position
					new_knife.rotation_degrees = $".".rotation_degrees
					if $".".rotation_degrees == 0:
						new_knife.direction = up
					elif $".".rotation_degrees == 90:
						new_knife.direction = right
					elif $".".rotation_degrees == -180:
						new_knife.direction = down
					elif $".".rotation_degrees == -90:
						new_knife.direction = left
					else:
						if velocity.y > 0:
							new_knife.direction = down
						else:
							new_knife.direction = up
							new_knife.global_rotation = 0
					throwing_knife_one = 1

func _physics_process(delta):
	if pause == false:
		get_input(delta)
		move_and_slide()
		theif()


func _on_button_pressed():
	pause = true
	$"../GuardBody/Camera2D".make_current()
	$"../GuardBody".pause = false

func theif():
	pass


func _on_timer_timeout() -> void:
	speed = 5000
