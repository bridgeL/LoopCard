extends Resource
class_name Battle

@export var monster: Monster
@export var player: Player
@export var card_deck: CardDeck
@export var is_player_turn: bool
@export var is_battle_end: bool
	
func player_play_card():
	if not is_player_turn:
		print("不在玩家的回合")
		return
		
	var card = card_deck.get_current_card()
	
	# 检查费用
	if player.focus < 1:
		print("专注力不足")
		return
		
	if player.action_points < card.fee:
		print("行动力不足")
		return

	player.focus -= 1
	player.action_points -= card.fee
	player.notify_scenes()
	
	card.play(self)
	
func player_switch_card():
	if not is_player_turn:
		print("不在玩家的回合")
		return
	
	# 检查费用
	if player.action_points < 1:
		print("行动力不足")
		return
		
	player.action_points -= 1
	player.focus += 1
	if player.focus > 1:
		player.focus = 1
	player.notify_scenes()
	
	card_deck.switch_card()

func player_end_turn():
	if not is_player_turn:
		print("不在玩家的回合")
		return
	
	is_player_turn = false
	print("玩家回合结束")
	
	# monster act
	monster.act(player)
	
	# check end
	if player.health <= 0 or monster.health <= 0:
		is_battle_end = true
		return
	
	is_player_turn = true
	print("玩家回合开始")
	
	player.focus = 1
	player.action_points = 6
	player.notify_scenes()
	
