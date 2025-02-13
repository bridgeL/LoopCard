extends Node2D

@export var player: Player

func _ready() -> void:
	$Player.load_player(player)
	$Button.connect("button_down", self.add_str)

func add_str():
	player.strenth += 1
	player.notify_scenes()
