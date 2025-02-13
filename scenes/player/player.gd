extends Node2D


func load_player(player: Player):
	player.bind_scene(self, "update_player")
	update_player(player)
	
func update_player(player: Player):
	$HP.text = "生命: " + str(player.health) 
	$SD.text = "护盾: " + str(player.shield) 
	$STR.text = "力量: " + str(player.strenth) 
	$INT.text = "智力: " + str(player.intelligence) 
	$AGI.text = "敏捷: " + str(player.agility) 
	$AP.text = "行动力: " + str(player.action_points) 
	$FP.text = "专注力: " + str(player.focus) 
	$ExFP.text = "额外专注力：" + str(player.extra_focus) 	
