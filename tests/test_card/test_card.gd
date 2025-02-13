extends Node2D

@export var card: Card

func _ready() -> void:
	$Button.connect("button_down", self.add_boom_tip)
	$Button2.connect("button_down", self.remove_boom_tip)
	card = Card.new()
	card.fee = 1
	card.label = Card.CardLabel.ATTACK
	card.description = "此处展示卡牌效果"
	card.rank = Card.CardRank.BLUE
	card.tips = []
	$Card.load_card(card)

func add_boom_tip():
	var tip = CardTip.new()
	tip.name = "爆炸"
	tip.color = Color(1.0, 0.0, 0.0)
	card.tips.append(tip)
	card.notify_scenes()

func remove_boom_tip():
	card.tips.remove_at(0)
	card.notify_scenes()
