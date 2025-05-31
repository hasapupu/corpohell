class_name trap extends Area2D

func onEnter(sol:soul):
	if sol != null:
		print("hit")
		sol.onSuffer.emit(sol.sufferAmount)
