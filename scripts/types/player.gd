extends Renderable
class_name Player

@export var health: int
@export var shield: int
@export var strenth: int
@export var intelligence: int
@export var agility: int
@export var action_points: int
@export var focus: int
@export var extra_focus: int

func be_attacked(damage: int):
	if shield >= damage:
		shield -= damage
	else:
		damage -= shield
		shield = 0
		health -= damage
	notify_scenes()

func get_shield(value: int):
	shield += value
	notify_scenes()
