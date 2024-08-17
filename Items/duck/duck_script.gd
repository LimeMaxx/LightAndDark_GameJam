extends CharacterBody2D

var speed = 2500.0
var move_vector = null
var direction

func _process(delta):
		velocity = speed * direction * delta
		move_and_slide()
		


func _on_duck_area_body_entered(body: Node2D) -> void:
	if body != CharacterBody2D:
		if body.has_method("freeze"):
			body.freeze()
			queue_free()
		queue_free()
