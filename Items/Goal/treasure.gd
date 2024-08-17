extends Area2D


func _on_next_pressed() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	$CanvasLayer/ColorRect.visible = true
	get_tree().paused = true


func _on_quit_pressed() -> void:
	get_tree().quit()
