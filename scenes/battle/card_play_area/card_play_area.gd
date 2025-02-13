extends Control

var card_index: int = 0
var cards: Array[Card] = []
var card2: Card

signal turn_end

func _ready() -> void:
	$Card.connect("button_down", self.run_card)
	$Card2.connect("button_down", self.switch_card)

func load_cards(_cards: Array[Card], _card2: Card):
	cards = _cards
	card2 = _card2
	card_index = 0
	$Card.load_card(cards[card_index])
	$Card2.load_card(card2)

func run_card():
	print(cards[card_index].name)
	
func switch_card():
	card_index += 1
	if card_index >= cards.size():
		card_index = 0
	$Card.load_card(cards[card_index])

func end_turn():
	emit_signal("turn_end")

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		# 检查是否在节点范围内
		var mouse_pos = event.position
		if get_rect().has_point(mouse_pos):
			if event.button_index == MOUSE_BUTTON_LEFT:
				run_card()
			elif event.button_index == MOUSE_BUTTON_RIGHT:
				switch_card()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		end_turn()
