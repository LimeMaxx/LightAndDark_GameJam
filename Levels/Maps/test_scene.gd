extends Node2D

var reverse
@onready var progress = %EnemyPath.progress_ratio

func _process(_delta):
	if progress < 1 and reverse == 0:
		progress += .01
		%EnemyPath.progress_ratio = progress
	else:
		reverse = 1
	if reverse == 1 and progress > 0:
		progress -= .01
		%EnemyPath.progress_ratio = progress
	else:
		reverse = 0
