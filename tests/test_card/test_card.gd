extends Node2D

@export var card: Card
@export var card_tip: CardTip

func _ready() -> void:
	$Button.connect("button_down", self.add_boom_tip)
	$Button2.connect("button_down", self.remove_boom_tip)
	$Card.load_card(card)

func add_boom_tip():
	card.add_tip(card_tip)

func remove_boom_tip():
	card.remove_tip(card_tip)
	
