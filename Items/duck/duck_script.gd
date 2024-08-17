extends CharacterBody2D

var speed = 2500
var move_vector = null #type Vector2
var direction

func _ready():
	#direction = Vector2.RIGHT.angle()
	#direction = 
	print("ready!")

func _process(delta):
	velocity = speed * direction * delta
	move_and_slide()
	#pass

func _on_duck_area_body_entered(body: Node2D) -> void:
	if body != CharacterBody2D:
		queue_free()
	#pass # Replace with function body.
