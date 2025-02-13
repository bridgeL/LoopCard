extends Renderable
class_name Monster

@export var health: int
@export var shield: int
@export var name: String
@export var intention: String

func be_attacked(damage: int):
	if shield >= damage:
		shield -= damage
	else:
		damage -= shield
		shield = 0
		health -= damage
	
	notify_scenes()

func act(player: Player):
	if intention == "攻击":
		player.be_attacked(5)
		intention = "防御"
	else:
		intention = "攻击"
		shield += 5
	
	notify_scenes()
