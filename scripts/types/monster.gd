extends Renderable
class_name Monster

@export var health: int = 0
@export var shield: int = 0
@export var name: String = ""
@export var intention: String = ""

func be_attacked(damage: int):
	if shield >= damage:
		shield -= damage
		notify_scenes()
	else:
		damage -= shield
		shield = 0
		health -= damage
		notify_scenes()
