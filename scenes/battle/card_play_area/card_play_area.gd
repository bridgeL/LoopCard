extends Control

var card_index: int = 0
var cards: Array[Card] = []
var card2: Card
var battle: Battle

func _ready() -> void:
	$Card.connect("button_down", self.run_card)
	$Card2.connect("button_down", self.switch_card)
	$Button.connect("button_down", self.end_turn)

func load_battle(_battle: Battle):
	battle = _battle
	cards = battle.cards
	card2 = battle.card2
	card_index = 0
	$Card.load_card(cards[card_index])
	$Card2.load_card(card2)
	battle.bind_scene(self, "check_player_turn")
	
func check_player_turn(battle: Battle):
	if not battle.is_player_turn:
		$Button.mouse_filter = MOUSE_FILTER_IGNORE
		$Card.mouse_filter = MOUSE_FILTER_IGNORE
		$Card2.mouse_filter = MOUSE_FILTER_IGNORE
		mouse_filter = MOUSE_FILTER_IGNORE
	else:
		$Button.mouse_filter = MOUSE_FILTER_STOP
		$Card.mouse_filter = MOUSE_FILTER_STOP
		$Card2.mouse_filter = MOUSE_FILTER_STOP
		mouse_filter = MOUSE_FILTER_STOP

func run_card():
	cards[card_index].run_card(battle)
	
func switch_card():
	if battle.player.action_points < 1:
		return
		
	battle.player.action_points -= 1
	battle.player.focus += 1
	if battle.player.focus > 1:
		battle.player.focus = 1
	battle.player.notify_scenes()
	
	card_index += 1
	if card_index >= cards.size():
		card_index = 0
	$Card.load_card(cards[card_index])

func end_turn():
	battle.player_end_turn()

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		# 检查是否在节点范围内
		var mouse_pos = event.global_position
		if get_rect().has_point(mouse_pos):
			if event.button_index == MOUSE_BUTTON_LEFT:
				run_card()
			elif event.button_index == MOUSE_BUTTON_RIGHT:
				switch_card()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		end_turn()
