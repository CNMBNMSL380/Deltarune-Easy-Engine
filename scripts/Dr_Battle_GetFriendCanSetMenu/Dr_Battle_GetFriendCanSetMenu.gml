// Script assets have changed for v2.3.0 see
function Dr_Battle_GetFriendCanSetMenu(SLOT){
	var Main = dr_battle_main;
	var friend = Main._player_friend[SLOT];
	return friend._char_can_set_menu;
}