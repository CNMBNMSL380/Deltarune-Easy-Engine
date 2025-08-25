// Script assets have changed for v2.3.0 see
function Dr_Battle_CallFriendEvent(SLOT = -1 , EVENT){
	var Main = dr_battle_main;
	
	if(SLOT == -1){
		with(dr_battle_char_player){
			 event_user(EVENT)
		}
	}
	else{
		with(Main._player_friend[SLOT]){
			event_user(EVENT)
		}
	}
}