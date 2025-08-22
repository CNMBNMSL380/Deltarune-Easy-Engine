// Script assets have changed for v2.3.0 see
function Dr_Battle_MainDataReset(){
	var Main = dr_battle_main;
	var friendMain = Main._player_friend;
    var friendClass = Main._player_friend_class;
    var friendNum = Main._player_friend_num;
	for(var i =0; i< array_length(friendClass) ; i++){
		friendClass[i]._header_ico_index = 0;
	}
	
	with(Main){
		event_user(0);
	}
}