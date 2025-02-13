extends Node2D

func load_monster(monster: Monster):
	monster.bind_scene(self, "update_monster")
	update_monster(monster)
	
func update_monster(monster: Monster):
	$HP.text = "生命: " + str(monster.health) 
	$SD.text = "护盾: " + str(monster.shield) 
	$Name.text = monster.name
	$Intention.text = monster.intention
