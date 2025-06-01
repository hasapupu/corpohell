class_name boundingBox extends Area2D

@export var myDirection: Vector2 = Vector2(-1,0)

func _ready():
	body_entered.connect(onBodyEntered)
	ow()

func onBodyEntered(body:CharacterBody2D):
	if body != null:
		body.velocity *= myDirection
		body.onSuffer.emit(body.sufferAmount)

func ow():
	pass
