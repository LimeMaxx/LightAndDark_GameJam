extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body == $"../GuardBody" :
		$"../GuardBody".can_duck = 1
		queue_free()
