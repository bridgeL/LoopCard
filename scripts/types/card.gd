@tool
extends Resource
class_name Card

enum CardRank { GREEN = 1, BLUE = 2, GOLDEN = 3, RED = 4 }
enum CardLabel { ATTACK = 1, SHIELD = 2, HEAL = 3, SWITCH = 4 }

@export var title: String
@export var content: String
@export var rank: CardRank
@export var label: CardLabel
@export var tips: Array[Tip]

func get_face_texture() -> Texture2D:
	var texture: Texture2D = null
	match(label):
		CardLabel.ATTACK: texture = load("res://assets/card_face/1.png")
		CardLabel.SHIELD: texture = load("res://assets/card_face/2.png")
		CardLabel.HEAL: texture = load("res://assets/card_face/3.png")
		CardLabel.SWITCH: texture = load("res://assets/card_face/4.png")
	return texture
	
func get_border_texture() -> Texture2D:
	var texture: Texture2D = null
	match(rank):
		CardRank.RED: texture = load("res://assets/card_border/1.png")
		CardRank.BLUE: texture = load("res://assets/card_border/2.png")
		CardRank.GREEN: texture = load("res://assets/card_border/3.png")
		CardRank.GOLDEN: texture = load("res://assets/card_border/4.png")
	return texture
	
