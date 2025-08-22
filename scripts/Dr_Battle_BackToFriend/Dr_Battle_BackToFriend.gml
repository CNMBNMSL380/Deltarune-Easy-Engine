// Script assets have changed for v2.3.0 see
function Dr_Battle_BackToFriend(REFRESH_TEXT =false){
	var Main = dr_battle_main;
	var UI = dr_battle_ui;

	var FriendMain = Main._player_friend;
	var FriendClass = Main._player_friend_class;
	var FriendNum = Main._player_friend_num;
	
	var UIClass = Main._player_friend_class[FriendNum-1];
	UIClass._header_ico_index = 0;
	
	array_pop(Main._player_GoToEvent);
	FriendClass[FriendNum].animSwitch();
	FriendClass[FriendNum-1].animSwitch();
	Main._player_friend_num --;
	
	Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON,,REFRESH_TEXT);
}