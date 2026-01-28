/// @description 事件
live;

var Main = dr_battle_main
var Main_FightSlot = Main._player_fight_slot;

if(Input_IsPressed(INPUT.CONFIRM) and Main_FightSlot == fight_slot){
    // 玩家主动触发攻击
	event_user(0)
	
}

if(!knife_is_done){
	knife_x -= 2;
}