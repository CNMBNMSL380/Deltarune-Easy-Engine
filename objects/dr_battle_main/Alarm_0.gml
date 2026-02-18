/// @description 初始化战斗场景
live;

Flag_Set(FLAG_STATIC,"overworld_mode",1);

var read_battle_data = function(DATA){
	if(is_struct(DATA)){
		return {
			cX: DATA.cX,
			cY: DATA.cY,
			depth: DATA.depth,
			btlInst: DATA.btlInst,
			posX: DATA.posX,
			posY: DATA.posY
		};
	}
	return {
		cX: DATA[0],
		cY: DATA[1],
		depth: DATA[2],
		btlInst: DATA[3],
		posX: DATA[4],
		posY: DATA[5]
	};
}

// 创建UI和基础战斗对象
instance_create_depth(0,0,0,dr_battle_bg)
instance_create_depth(37,42,0,dr_battle_ui_tp)
with(instance_create_depth(0,0,0,dr_battle_ui)){
	Anim_Create(id,"pos_y",2,1,180,-180,25,25)
}
instance_create_depth(0,0,0,battle_misc);

// 根据传入数据生成敌人
for(var i =0 ; i < array_length(_enemy_ow_obj) ; i++){
	var enemyData = read_battle_data(_enemy_ow_obj[i]);
	if(enemyData.btlInst == undefined or enemyData.btlInst == noone){
		continue;
	}
	Dr_Battle_AddEnemy(i,enemyData.cX,enemyData.cY,enemyData.depth,enemyData.btlInst,true,enemyData.posX,enemyData.posY);
}

// 根据传入数据生成队友
for(var i = 0 ; i < array_length(_player_friend_ow_obj) ; i++){
	var friendData = read_battle_data(_player_friend_ow_obj[i]);
	if(friendData.btlInst == undefined or friendData.btlInst == noone){
		continue;
	}

	_player_friend[i] = instance_create_depth(friendData.cX,friendData.cY,friendData.depth,friendData.btlInst)
	_player_friend[i]._char_id = i;
	with(_player_friend[i]){
		event_user(0)
	}

	var friendIns = _player_friend[i];
	Anim_Create(friendIns,"x",0,0,friendData.cX,friendData.posX - friendIns.x,25)
	Anim_Create(friendIns,"y",0,0,friendData.cY,friendData.posY - friendIns.y,25)
}

// 隐藏地图中的战斗相关对象
with (all) {
	var battleMode = variable_instance_get(id,"battle_mod");
	if(battleMode != undefined){
		if(battleMode >= -1){
			array_push(dr_battle_main.ow_obj,id);
			visible = false;
			instance_deactivate_object(id);
		}
	}
}

_player_friend_class = Dr_Battle_CreateClass(_player_friend);
_battle_board_inst = Dr_Battle_CreateBoard();

if(array_length(_player_friend_ow_obj) > 0){
	var firstFriendData = read_battle_data(_player_friend_ow_obj[0]);
	_player_soul_start_x = firstFriendData.posX;
	_player_soul_start_y = firstFriendData.posY - 40;
}else{
	_player_soul_start_x = 320;
	_player_soul_start_y = 320;
}

var startX = _player_soul_start_x;
var startY = _player_soul_start_y;
_player_soul_inst = instance_create_depth(startX,startY,0,dr_battle_soul_red);
_player_soul_inst.image_alpha = 0;

show_debug_message("主要" + string(_enemy_ow_obj));

alarm[1] = 65;
