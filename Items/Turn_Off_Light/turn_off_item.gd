extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body == $"../GuardBody" :
		$"../GuardBody".can_item_turn_off = 1
		queue_free()
