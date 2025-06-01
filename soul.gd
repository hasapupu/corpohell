class_name soul extends CharacterBody2D

signal onSuffer(val:int)
signal onDeath
var sufferAmount := 1.0
var sufferFreq := 1.0
var lifeTime: float = 9
var speed := 30.0

func start():
	get_node("AnimationPlayer").play("soulrun")
	get_node("GPUParticles2D").emitting = true
	velocity = Vector2.ONE.rotated(randf_range(0,PI * 2)) * speed
	lifeTime *= randf_range(0.8,1.1)
	suffer()
	await get_tree().create_timer(lifeTime).timeout
	onDeath.emit()
	queue_free()


func suffer():
	onSuffer.emit(sufferAmount)
	get_node("GPUParticles2D2").emitting = true
	await get_tree().create_timer(sufferFreq).timeout
	suffer()

func _physics_process(_delta):
	move_and_slide()
