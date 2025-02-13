extends Renderable
class_name CardDeck

@export var cards: Array[Card]
@export var card2: Card
@export var card_index: int

func get_current_card():
	return cards[card_index]
	
func switch_card():
	card_index += 1
	if card_index >= cards.size():
		card_index = 0
	
	print("切换为", get_current_card().name)
	notify_scenes()
