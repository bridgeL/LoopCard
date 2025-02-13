extends Control

var battle: Battle

func _ready() -> void:
	$Card.connect("button_down", self.user_play_card)
	$Card2.connect("button_down", self.user_switch_card)
	$Button.connect("button_down", self.user_end_turn)

func load_battle(_battle: Battle):
	battle = _battle
	update_cards(battle.card_deck)
	battle.card_deck.bind_scene(self, "update_cards")
	
func update_cards(card_deck: CardDeck):
	$Card.load_card(card_deck.get_current_card())
	$Card2.load_card(card_deck.card2)
	
func user_play_card():
	print("用户试图打牌")
	battle.player_play_card()
	
func user_switch_card():
	print("用户试图切牌")
	battle.player_switch_card()	

func user_end_turn():
	print("用户试图结束回合")
	battle.player_end_turn()

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		# 检查是否在节点范围内
		var mouse_pos = event.global_position
		if get_rect().has_point(mouse_pos):
			if event.button_index == MOUSE_BUTTON_LEFT:
				user_play_card()
			elif event.button_index == MOUSE_BUTTON_RIGHT:
				user_switch_card()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		user_end_turn()
