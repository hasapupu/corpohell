class_name soul extends CharacterBody2D

signal onSuffer(val:int)
signal onDeath
var sufferAmount := 1.0
var sufferFreq := 1.0
var lifeTime: int = 9
var speed := 30.0

func start():
	velocity = Vector2.ONE.rotated(randf_range(0,PI * 2)) * speed
	suffer()
	await get_tree().create_timer(lifeTime).timeout
	onDeath.emit()
	queue_free()


func suffer():
	onSuffer.emit(sufferAmount)
	await get_tree().create_timer(sufferFreq).timeout
	suffer()

func _physics_process(_delta):
	move_and_slide()
