extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body == $"../Thief_body" :
		$"../Thief_body".can_knife_throw = 1
		queue_free()
