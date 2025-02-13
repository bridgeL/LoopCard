@tool
extends Label

@export var color: Color
@export var label: String

func _ready():
	self.text = "[" + label + "]"
	self.modulate = color
