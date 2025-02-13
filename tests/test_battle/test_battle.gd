extends Node2D

@export var battle: Battle

func _ready() -> void:
	$Battle.load_battle(battle)
