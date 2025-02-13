extends Renderable
class_name Player

@export var health: int = 0
@export var shield: int = 0
@export var strenth: int = 0
@export var intelligence: int = 0
@export var agility: int = 0
@export var action_points: int = 0
@export var focus: int = 0
@export var extra_focus: int = 0

func be_attacked(damage: int):
	if shield >= damage:
		shield -= damage
		notify_scenes()
	else:
		damage -= shield
		shield = 0
		health -= damage
		notify_scenes()

func get_shield(value: int):
	shield += value
	notify_scenes()
