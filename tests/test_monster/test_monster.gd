extends Node2D

@export var monster: Monster

func _ready() -> void:
	$Monster.load_monster(monster)
	$Button.connect("button_down", self.add_hp)

func add_hp():
	monster.health += 1
	monster.notify_scenes()
