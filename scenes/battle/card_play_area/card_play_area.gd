extends Node2D

var card_index: int = 0
var cards: Array[Card] = []
var card2: Card

func _ready() -> void:
	$Card.connect("button_down", self.run_card)
	$Card2.connect("button_down", self.switch_card)

func load_cards(_cards: Array[Card], _card2: Card):
	cards = _cards
	card2 = _card2
	card_index = 0
	$Card.load_card(cards[card_index])
	$Card2.load_card(card2)

func run_card():
	print(cards[card_index].name)
	
func switch_card():
	card_index += 1
	if card_index >= cards.size():
		card_index = 0
	$Card.load_card(cards[card_index])
