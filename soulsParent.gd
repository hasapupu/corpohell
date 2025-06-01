class_name soulParent extends Node

var playing:bool = false:
	set(value):
		print("set")
		if value == false:
			onRoundEnd()
		playing = value
			
	
@onready var scoreText: RichTextLabel = get_parent().get_node("RichTextLabel")
var currScore := 0.0

func onButtonPress():
	print("buttonPress")
	if playing == false:
		playing = true
		for i in get_children():
			if i is soul:
				i.onSuffer.connect(updateScore)
				i.start()

func _process(_delta):
	if getSoulCount() == 0 and playing:
		print("aaaaaaa")
		playing = false
	scoreText.text = str(currScore)

func updateScore(val: int):
	currScore += val	

func onRoundEnd():
	await get_tree().create_timer(1).timeout
	var man = (get_tree().root.get_node("gameManager") as main)
	man.money += floor(currScore)
	currScore = 0
	await get_tree().create_timer(0.3).timeout
	if man.money < man.quota:
		print(man.money, man.quota)
		get_tree().reload_current_scene()
		return
	man.money -= man.quota
	get_tree().root.get_node("gameManager/NinePatchRect2").setup()
	man.shopAnim.play("shopStart")

func getSoulCount() -> int:
	var out = 0
	for i in get_children():
		if i is soul:
			out += 1
	return out
