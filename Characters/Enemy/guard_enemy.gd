extends CharacterBody2D

var move = false

func _process(delta: float) -> void:
	move_local_x(.01)
	if move == true:
		look_at($"../Thief_body".global_position)

func _on_area_2d_body_entered(body: Node2D):
	if move == false:
		if body.has_method("theif"):
			move = true
			$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().paused = true
	$CanvasLayer/ColorRect.visible = true


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/Maps/test_scene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
	
func killed():
	queue_free()

func freeze():
	$Timer2.start()
	$".".process_mode = Node.PROCESS_MODE_DISABLED

func _on_timer_2_timeout() -> void:
	$".".process_mode = Node.PROCESS_MODE_INHERIT
