extends Label

func load_card_tip(card_tip: CardTip):
	self.text = "[" + card_tip.name + "]"
	self.modulate = card_tip.color
