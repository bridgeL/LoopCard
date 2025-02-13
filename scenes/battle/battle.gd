extends Node2D

func load_battle(battle: Battle):
	$CardPlayArea.load_battle(battle)	
	$Monster.load_monster(battle.monster)	
	$Player.load_player(battle.player)	
