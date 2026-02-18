/// @description 战斗结束
live;

var objData = _player_friend_ow_obj;
var friend = _player_friend;

var read_return_data = function(DATA){
	if(is_struct(DATA)){
		return {
			cX: DATA.cX,
			cY: DATA.cY
		};
	}
	return {
		cX: DATA[0],
		cY: DATA[1]
	};
}

for(var i = 0; i < array_length(friend) ; i++){
	var xx = friend[i].x;
	var yy = friend[i].y;
	var backData = read_return_data(objData[i]);

	Anim_Create(friend[i],"x",0,0,xx,backData.cX - xx,25);
	Anim_Create(friend[i],"y",0,0,yy,backData.cY - yy,25);
}

// 准备激活所有物体
instance_activate_all();

MyAlarm_Add("MainClose",function(){
	instance_destroy(battle_soul);
	instance_destroy(dr_battle_board);
	instance_destroy(dr_battle_ui);
	instance_destroy(dr_battle_bg);
	instance_destroy(dr_battle_ui_tp);
	instance_destroy(battle_misc);

	for(var i = 0; i < array_length(_player_friend); i++){
		instance_destroy(_player_friend[i]);
		instance_destroy(_player_friend_class[i]);
	}

	char_player.moveable = true;
	instance_destroy(dr_battle_main);
},25)
