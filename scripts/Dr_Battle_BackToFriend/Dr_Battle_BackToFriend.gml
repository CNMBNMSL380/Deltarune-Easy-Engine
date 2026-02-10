// Script assets have changed for v2.3.0 see
function Dr_Battle_BackToFriend(REFRESH_TEXT =false){
	var Main = dr_battle_main;
	var UI = dr_battle_ui;

	var FriendMain = Main._player_friend;
	var FriendClass = Main._player_friend_class;
	var FriendNum = Main._player_friend_num;
	
	FriendClass[Main._player_friend_num].animSwitch();
	FriendClass[Main._player_friend_num]._header_ico_index = 0;
	
	Main._player_friend_num --;
	
	for( ; array_length(FriendMain) > 0 ; Main._player_friend_num --){
		if(FriendMain[Main._player_friend_num].is_controlled and Char_GetTeamHp(Main._player_friend_num) > 0){
			var tp_black = Main._player_GoToEvent[Main._player_friend_num].friend_use_tp;
			Dr_Battle_AddTp(tp_black);
			array_pop(Main._player_GoToEvent);
			array_pop(Main._player_item_is_use);
			
			FriendClass[_player_friend_num].animSwitch();
			
			Dr_Battle_SetSpriteMode(Main._player_friend[Main._player_friend_num],DR_PLAYER_INDEX.IDLE);
			Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON,,REFRESH_TEXT);
			
			return true;
		}
	}
	
	//var tp_black = Main._player_GoToEvent[FriendNum-1].friend_use_tp;
	//Dr_Battle_AddTp(tp_black);
	
	
	//var UIClass = Main._player_friend_class[FriendNum-1];
	//UIClass._header_ico_index = 0;
	
	//array_pop(Main._player_GoToEvent);
	//array_pop(Main._player_item_is_use);
	
	//FriendClass[FriendNum].animSwitch();
	//FriendClass[FriendNum-1].animSwitch();
	
	//Main._player_friend_num --;
	//Dr_Battle_SetSpriteMode(Main._player_friend[Main._player_friend_num],DR_PLAYER_INDEX.IDLE);
	
	//Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON,,REFRESH_TEXT);
}