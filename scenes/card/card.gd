extends Button

var tip_scene = load("res://scenes/card/tip/tip.tscn")
var tip_nodes = []
var _card: Card

func load_card(card: Card):
	if _card:
		_card.unbind_scene(self)

	update_card(card)
	_card = card
	card.bind_scene(self, "update_card")


func update_card(card: Card):
	$Name.text = card.name
	$Face.texture = card.card_face
	$Description.text = card.description
	$Background.texture = card.card_bg_img
	
	for child in $Tips.get_children():
		child.free()

	for tip in card.tips:
		var node = tip_scene.instantiate()
		node.load_card_tip(tip)
		$Tips.add_child(node)
