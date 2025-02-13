extends Node2D

var test = TestNumber.new()

func _ready() -> void:
	bind()
	$Button.connect("button_down", self.add)
	$Button2.connect("button_down",self.unbind)
	$Button3.connect("button_down", self.bind)

func bind():
	test.bind_scene(self)
	
func unbind():
	test.unbind_scene(self)

func add():
	test.add()
	print("调用test.add一次，当前值：" + str(test.number))

func update(test: TestNumber):
	$Label.text = "功德：" + str(test.number)
