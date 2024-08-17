extends PathFollow2D

var reverse = 0

func _process(delta: float) -> void:
	if $".".progress_ratio < 1 and reverse == 0:
		$".".progress_ratio += .01
	elif $".".progress_ratio >= 1 and reverse == 0:
		reverse = 1
	elif $".".progress_ratio > 0 and reverse == 1:
		$".".progress_ratio -= .01
	elif $".".progress_ratio <= 0 and reverse == 1:
		reverse = 0
