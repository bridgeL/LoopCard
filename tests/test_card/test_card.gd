extends Node2D


func _ready() -> void:
	$Button.connect("button_down", self.add_boom_tip)
	$Button2.connect("button_down", self.remove_boom_tip)

func add_boom_tip():
	var tip = Tip.new()
	tip.name = "爆炸"
	tip.color = Color(1.0, 0.0, 0.0)
	$Card.add_tip(tip)

func remove_boom_tip():
	var i = $Card.find_tip_index("爆炸")
	$Card.remove_tip_by_index(i)
