// Script assets have changed for v2.3.0 see
function Dr_Battle_GetFriendName(SLOT){
	var Main = dr_battle_main;
	var friend = Main._player_friend;
	if(SLOT < array_length(friend)){
		return friend[SLOT]._char_name;
	}
	
}
function Dr_Battle_GetFriendNameByInstance(INST){
	
}
function Dr_Battle_GetFriendNameAll(){
	var Main = dr_battle_main;
	var friend = Main._player_friend;
	var ary = [];
	for(var i = 0; i < array_length(friend); i++){
		var name = Dr_Battle_GetFriendName(i)
		array_push(ary,name);
	}
	return ary
}