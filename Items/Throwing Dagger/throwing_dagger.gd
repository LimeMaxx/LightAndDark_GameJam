extends CharacterBody2D

var speed = 6000.0
var move_vector = null #type Vector2
var direction

func _process(delta):
	velocity = speed * direction * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("killed"):
		body.killed()
		queue_free()
	elif body != CharacterBody2D:
		queue_free()
