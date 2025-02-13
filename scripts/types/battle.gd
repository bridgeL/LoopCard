extends Renderable
class_name Battle

@export var monster: Monster
@export var player: Player
@export var cards: Array[Card]
@export var card2: Card
@export var is_player_turn: bool
@export var is_battle_end: bool

func init_entities(_player: Player, _monster: Monster, _cards: Array[Card], _card2: Card):
	player = _player
	monster = _monster
	cards = _cards
	card2 = _card2
	is_player_turn = true
	is_battle_end = false
	notify_scenes()

func player_end_turn():
	is_player_turn = false
	notify_scenes()
	print("玩家回合结束")
	
	await delay(1)
	
	# monster act
	if monster.intention == "攻击":
		player.be_attacked(5)
		monster.intention = "防御"
		monster.notify_scenes()
	else:
		monster.intention = "攻击"
		monster.shield += 5
		monster.notify_scenes()
	
	# check end
	if player.health <= 0 or monster.health <= 0:
		is_battle_end = true
		return
	
	
	is_player_turn = true
	notify_scenes()
	print("玩家回合开始")
	
	player.focus = 1
	player.action_points = 6
	player.notify_scenes()
	
