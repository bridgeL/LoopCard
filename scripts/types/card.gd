extends Renderable
class_name Card

enum CardRank { GREEN, BLUE, GOLDEN, RED }
enum CardLabel { ATTACK, SHIELD, HEAL, SWITCH }

@export var label: CardLabel
@export var rank: CardRank
@export var name: String
@export var fee: int
@export var description: String
@export var tips: Array[CardTip]
@export var card_face: Texture2D
@export var card_bg_img: Texture2D

func find_tip(_tip: CardTip):
	for i in range(tips.size()):
		var tip = tips[i]
		if tip.label == _tip.label:
			return i
	return -1
	
func add_tip(_tip: CardTip):
	if find_tip(_tip) >= 0:
		return
	tips.append(_tip)
	notify_scenes()
	
func remove_tip(_tip: CardTip):
	var i = find_tip(_tip)
	if i < 0:
		return
	tips.remove_at(i)
	notify_scenes()
	
func play(battle: Battle):
	print("打出", name)
		
	match(label):
		CardLabel.ATTACK: 
			battle.monster.be_attacked(3)
			battle.monster.notify_scenes()
		CardLabel.SHIELD: 
			battle.player.get_shield(3)
			battle.player.notify_scenes()
