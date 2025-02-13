extends Node2D

@export var battle: Battle

func _ready() -> void:
	$CardPlayArea.load_battle(battle)
