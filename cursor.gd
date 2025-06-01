class_name cursor extends Sprite2D

@onready var clickedSprite := preload("res://sprites/satanhand2.png") as Texture2D
@onready var normalSprite := preload("res://sprites/satanhand1.png") as Texture2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		texture = clickedSprite
	else:
		texture = normalSprite
	position = get_global_mouse_position()
