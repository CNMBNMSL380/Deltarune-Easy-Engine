/// @description 事件
live;

//获取生命值状态
if(instance_exists(friend_ins)){
	var char_id = friend_ins._char_id;
	
	hp = Char_GetTeamHp(char_id);	
	hp_max = Char_GetTeamMaxHp(char_id);
}
