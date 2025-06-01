class_name main extends Node

var round:= 1
@onready var roundText := get_node("Rounds") as RichTextLabel
var inShop := false
var money:=0
var souls:=5
var traps:=2
@onready var trapPrefab:= preload("res://tra[.tscn")
@onready var moneyText := get_node("Money") as RichTextLabel
@onready var soulButton:= get_node("Souls") as Button
@onready var trapButton:= get_node("Traps") as Button
@onready var soulPrefab:= preload("res://soul.tscn")
@onready var shopAnim:= get_node("AnimationPlayer") as AnimationPlayer
var quota:= 40
@onready var quotaText := get_node("NinePatchRect/RichTextLabel2")

func onSoulButton():
	if souls > 0:
		souls -= 1
		var newsoul = soulPrefab.instantiate()
		newsoul.global_position = Vector2(randf_range(10,190),randf_range(10,100))
		get_node("NinePatchRect/souls").add_child(newsoul)

func onTrapButton():
	if traps > 0:
		traps -= 1
		var newTrap = trapPrefab.instantiate()
		newTrap.global_position = Vector2(randf_range(10,190),randf_range(10,100))
		get_node("NinePatchRect/souls").add_child(newTrap)

func _process(delta):
	quotaText.text= "Quota: " + str(quota)
	moneyText.text = "$" + str(money)
	soulButton.text = "Souls: " + str(souls)
	trapButton.text = "Traps: " + str(traps)
	roundText.text = "Day: " + str(round) 

func onX():
	round += 1
	shopAnim.play("shopEnd")
