extends Node2D

@export var monster: Monster

func _ready() -> void:
	monster = Monster.new()
	monster.name = "灭世魔王"
	monster.intention = "睡觉"
	monster.health = 10
	monster.shield = 10
	$Monster.load_monster(monster)
	$Button.connect("button_down", self.add_hp)

func add_hp():
	monster.health += 1
	monster.notify_scenes()
