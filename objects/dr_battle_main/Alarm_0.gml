/// @description 初始化事件
live;
//从缓冲区接收数据


//创建UI界面并启动动画
instance_create_depth(0,0,0,dr_battle_bg)
instance_create_depth(37,42,0,dr_battle_ui_tp)

	//instance_create_depth(0,366 + ( 0 * 36) ,0,dr_battle_menuFight);
	//instance_create_depth(0,366 + ( 1 * 36) + 2,0,dr_battle_menuFight);
	//instance_create_depth(0,366 + ( 2 * 36) + 4,0,dr_battle_menuFight);

with(instance_create_depth(0,0,0,dr_battle_ui)){
	Anim_Create(id,"pos_y",2,1,180,-180,25,25)
	
}
//nstance_create_depth(0,0,0,battle_board_1)
instance_create_depth(0,0,0,battle_misc);

//生成敌人
for(var i =0 ; i< array_length(_enemy_obj) ; i++){
	//var enemy_ins = Dr_Battle_AddEnemy(i,_enemy_obj[i][0],_enemy_obj[i][1],_enemy_obj[i][2],_enemy_obj[i][3] , true , _enemy_obj[i][4] , _enemy_obj[i][5]);
	//var enemy_stc = new Dr_Battle_EnemyBase(i,enemy_ins);
	_enemy[i] = new Dr_Battle_EnemyBase(i);
	var enemy_ins = Dr_Battle_AddEnemy(i,_enemy_obj[i][0],_enemy_obj[i][1],_enemy_obj[i][2],_enemy_obj[i][3] , true , _enemy_obj[i][4] , _enemy_obj[i][5] , true);
	_enemy_ow_obj[i] = [_enemy_obj[i][0],_enemy_obj[i][1],_enemy_obj[i][3]];
}
show_message(_enemy_ow_obj)

//生成队友
for(var i = 0 ; i< array_length(_player_friend_obj) ; i++){
	_player_friend[i] = instance_create_depth(_player_friend_obj[i][0],_player_friend_obj[i][1],_player_friend_obj[i][2],_player_friend_obj[i][3])
	_player_friend[i]._char_id = i;
	Dr_Battle_CallFriendEvent(0)
	var friendIns = _player_friend[i];
	//移动队友到指定位置
	Anim_Create(friendIns,"x",0,0,_player_friend_obj[i][0],(_player_friend_obj[i][4]) - friendIns.x,25)
	Anim_Create(friendIns,"y",0,0,_player_friend_obj[i][1],(_player_friend_obj[i][5]) - friendIns.y,25)
}
//show_message(_player_friend);

// ------- 创建队友类窗口对象
_player_friend_class = Dr_Battle_CreateClass(_player_friend);

// ------- 初始化战斗框
_battle_board_inst = Dr_Battle_CreateBoard();

// ------- 初始化决心
_player_soul_start_x= _player_friend_obj[0][4];
_player_soul_start_y = _player_friend_obj[0][5] - 40;

var startX = _player_soul_start_x;
var startY = _player_soul_start_y;
_player_soul_inst = instance_create_depth(startX,startY,0,dr_battle_soul_red);
_player_soul_inst.image_alpha = 0;




show_debug_message("主要" + string(_enemy_obj));

alarm[1] = 65;
