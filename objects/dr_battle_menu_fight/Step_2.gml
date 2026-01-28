/// @description 用于确定攻击结束后给下一位队友攻击
live;
var Main = dr_battle_main
var Main_FightSlot = Main._player_fight_slot;

if(knife_is_done and Main_FightSlot == fight_slot){
	dr_battle_main._player_fight_slot ++;
}