@tool
extends Sprite2D

@export var card: Card

var tip_scene = load("res://scenes/card/tip/tip.tscn")
var tip_nodes = []

func _init_border_color():
	texture = card.get_border_texture()

func _init_card_face():
	$Face.texture = card.get_face_texture()

func _init_tips():
	for tip in card.tips:
		_add_tip_node(tip)

func _add_tip_node(tip: Tip):
	var node = tip_scene.instantiate()
	node.color = tip.color
	node.label = tip.name
	$Tips.add_child(node)
	tip_nodes.append(node)
	
func add_tip(tip: Tip):
	card.tips.append(tip)
	_add_tip_node(tip)
	
func remove_tip_by_index(index: int):
	if index == -1:
		return
	var node = tip_nodes[index]
	card.tips.remove_at(index)
	tip_nodes.remove_at(index)
	$Tips.remove_child(node)

func find_tip_index(name: String):
	for i in range(len(card.tips)):
		var tip = card.tips[i]
		if tip.name == name:
			return i
	return -1

func _ready():
	_init_border_color()
	_init_card_face()
	_init_tips()
	
	$Title.text = card.title
	$Content.text = card.content
