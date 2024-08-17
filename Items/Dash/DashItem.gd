extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body == $"../Thief_body" :
		$"../Thief_body".can_dash = 1
		queue_free()
