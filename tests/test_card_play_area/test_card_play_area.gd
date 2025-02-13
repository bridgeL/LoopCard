extends Node2D

@export var cards: Array[Card]
@export var card2: Card

func _ready() -> void:
	$CardPlayArea.load_cards(cards, card2)
	$CardPlayArea.connect("turn_end", self.on_turn_end)
	
func on_turn_end():
	print("player turn is ended")
