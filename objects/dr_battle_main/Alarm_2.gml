/// @description 战斗结束
live;

var objData = _player_friend_ow_obj;
var friend = _player_friend;

for(var i = 0; i < array_length(friend) ;i++){
	var xx = friend[i].x;
	var yy = friend[i].y;
	var fXx = objData[i][0]; 
	var fYy = objData[i][1]; 
	
	Anim_Create(friend[i],"x",0,0,xx,fXx - xx,25);
	Anim_Create(friend[i],"y",0,0,yy,fYy - yy,25);
	
}

//准备激活所有物体
instance_activate_all();

MyAlarm_Add("MainClose",function(){
	instance_destroy(battle_soul);
	instance_destroy(dr_battle_board);
	instance_destroy(dr_battle_ui);
	instance_destroy(dr_battle_bg);
	instance_destroy(dr_battle_ui_tp);
	instance_destroy(battle_misc);

	for(var i =0; i < array_length(_player_friend); i++){
		instance_destroy(_player_friend[i]);
		instance_destroy(_player_friend_class[i]);
	}
	
	char_player.moveable = true;
	instance_destroy(dr_battle_main);	
	
},25)

