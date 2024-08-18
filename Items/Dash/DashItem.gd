extends Area2D

@onready var anim: AnimatedSprite2D = $Animated_Dash

func _ready() -> void:
	anim.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body == $"../Thief_body" :
		$"../Thief_body".can_dash = 1
		queue_free()
