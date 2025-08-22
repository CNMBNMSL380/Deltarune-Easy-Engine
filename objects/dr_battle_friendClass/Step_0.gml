/// @description 事件
live;
if(instance_exists(friend_ins)){
	var char_id = friend_ins._char_id;
	if(char_id == 0){
		hp = Player_GetHp();
		hp_max = Player_GetHpMax();
	}
	else{
		char_id -=1;
		hp = Char_GetTeamHp(char_id);	
		hp_max = Char_GetTeamMaxHp(char_id);	
	}
}
