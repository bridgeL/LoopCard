extends Renderable
class_name TestNumber

@export var number = 0

func add():
	number += 1
	self.notify_scenes()
