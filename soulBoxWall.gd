class_name boundingBox extends Area2D

@export var myDirection: Vector2 = Vector2(-1,-1)

func _ready():
	body_entered.connect(onBodyEntered)

func onBodyEntered(body:CharacterBody2D):
	if body != null:
		body.velocity *= myDirection
