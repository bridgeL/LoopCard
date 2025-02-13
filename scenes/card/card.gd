extends Sprite2D

var tip_scene = load("res://scenes/card/tip/tip.tscn")
var tip_nodes = []

func load_card(card: Card):
	update_card(card)
	card.bind_scene(self, "update_card")

func update_card(card: Card):
	$Name.text = card.get_card_name()
	$Face.texture = card.get_card_face()
	$Description.text = card.description
	texture = card.get_card_bg_img()
	
	for child in $Tips.get_children():
		child.free()

	for tip in card.tips:
		var node = tip_scene.instantiate()
		node.load_card_tip(tip)
		$Tips.add_child(node)
