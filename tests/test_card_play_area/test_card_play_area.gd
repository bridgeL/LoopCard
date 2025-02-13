extends Node2D

@export var cards: Array[Card]
@export var card2: Card

func _ready() -> void:
	$CardPlayArea.load_cards(cards, card2)
