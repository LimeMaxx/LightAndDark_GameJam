extends Area2D

@onready var anim: AnimatedSprite2D = $Animated_Duck

func _ready() -> void:
	anim.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body == $"../GuardBody" :
		$"../GuardBody".can_duck = 1
		queue_free()
