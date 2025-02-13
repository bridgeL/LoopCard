extends Renderable
class_name Card

enum CardRank { GREEN, BLUE, GOLDEN, RED }
enum CardLabel { ATTACK, SHIELD, HEAL, SWITCH }

@export var label: CardLabel
@export var rank: CardRank
@export var fee: int
@export var description: String
@export var tips: Array[CardTip]

func get_card_name() -> String:
	var name = ""
	match(label):
		CardLabel.ATTACK: name = "攻击"
		CardLabel.SHIELD: name = "防御"
		CardLabel.HEAL: name = "治疗"
		CardLabel.SWITCH: name = "切牌"
	return name

func get_card_face() -> Texture2D:
	var texture: Texture2D = null
	match(label):
		CardLabel.ATTACK: texture = load("res://assets/card_face/1.png")
		CardLabel.SHIELD: texture = load("res://assets/card_face/2.png")
		CardLabel.HEAL: texture = load("res://assets/card_face/3.png")
		CardLabel.SWITCH: texture = load("res://assets/card_face/4.png")
	return texture
	
func get_card_bg_img() -> Texture2D:
	var texture: Texture2D = null
	match(rank):
		CardRank.RED: texture = load("res://assets/card_border/1.png")
		CardRank.BLUE: texture = load("res://assets/card_border/2.png")
		CardRank.GREEN: texture = load("res://assets/card_border/3.png")
		CardRank.GOLDEN: texture = load("res://assets/card_border/4.png")
	return texture
	
