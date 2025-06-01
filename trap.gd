class_name trap extends Area2D

func onEnter(sol:soul):
	if sol != null:
		print("hit")
		sol.onSuffer.emit(sol.sufferAmount)
		get_node("GPUParticles2D2").emitting = true
