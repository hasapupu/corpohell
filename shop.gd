class_name shop extends NinePatchRect

@onready var man: main = get_tree().root.get_node("gameManager")
var soulPrice:= 0
var trapPrice:= 0
var isTrapBought:= false
var isSoulBought:= false
var soulAmount:= 0
var trapAmount:= 0
@onready var soulButt := get_node("Button") as Button
@onready var trapButt := get_node("Button2") as Button


func setup():
	isTrapBought = false
	isSoulBought = false
	soulPrice = 5 + man.round * randf_range(2,4)
	trapPrice = 2 + man.round * randf_range(1,3)
	trapAmount = 9 + man.round * randf_range(8,9)
	soulAmount = 7 + man.round * randf_range(3,5)
	soulButt.text = "Souls:" + str(soulAmount)
	trapButt.text = "Traps:" + str(trapAmount)
	soulButt.get_node("RichTextLabel").text = str(soulPrice)
	trapButt.get_node("RichTextLabel").text = str(trapPrice)
	man.quota *= randf_range(8,12) * man.round

func onSoulBuy():
	if isSoulBought == false and man.money > soulPrice:
		soulButt.text = "Bought"
		isSoulBought = true
		man.money -= soulPrice
		man.souls += soulAmount

func onTrapBuy():
	if isTrapBought == false and man.money > trapPrice:
		trapButt.text = "Bought"
		isTrapBought = true
		man.money -= trapPrice
		man.traps += trapAmount
