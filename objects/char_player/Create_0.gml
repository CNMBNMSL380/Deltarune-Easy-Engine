live;
event_inherited();


battle_mod = 1
char_id=0;
char_friend_id = 0;

overworld_mode = 0;

_base = Char_CreatePlayer();
battle_obj = _base.battle_obj;
idle_sprite = _base.spr_idle;
move_sprite = _base.spr_move;
run_sprite = _base.spr_run;

move_speed[DIR.UP]=_base.move_speed_up;
move_speed[DIR.DOWN]=_base.move_speed_down;
move_speed[DIR.LEFT]=_base.move_speed_left;
move_speed[DIR.RIGHT]=_base.move_speed_right;


res_idle_sprite[DIR.UP]=idle_sprite[0];
res_idle_sprite[DIR.DOWN]=idle_sprite[1];
res_idle_sprite[DIR.LEFT]=idle_sprite[2];
res_idle_flip_x[DIR.LEFT]=false;
res_idle_sprite[DIR.RIGHT]=idle_sprite[3];

res_move_sprite[DIR.UP]=move_sprite[0];
res_move_sprite[DIR.DOWN]=move_sprite[1];
res_move_sprite[DIR.LEFT]=move_sprite[2];
res_move_flip_x[DIR.LEFT]=false;
res_move_sprite[DIR.RIGHT]=move_sprite[3];




//res_idle_flip_x[DIR.LEFT] = false;
//res_move_flip_x[DIR.LEFT] = false;

moveable=true;
_moveable_dialog=true;
_moveable_menu=true;
_moveable_save=true;
_moveable_warp=true;
_moveable_encounter=true;
_moveable_box=true;

follow_delay = 15
// ------------ follower 跟随团队
/*
获取Char的Team来添加所有队友

*/
follower = Char_CreateCharTeam();
// ----------------------
inst_follower = [noone,noone,noone]
if(array_length(follower) > 0){
	moves = ds_list_create()
	repeat(follow_delay*array_length(follower)){
		ds_list_add(moves,[0,0,0,0,0]);
	}
	pos = ds_list_create()
	repeat(follow_delay*array_length(follower)){
		ds_list_add(pos,[x,y]);
	}
}
