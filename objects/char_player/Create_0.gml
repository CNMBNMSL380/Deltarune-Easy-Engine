live;
event_inherited();

char_id=0;

battle_mod = 1
char_friend_id = 1;

battle_obj = dr_battle_char_player

overworld_mode = 0;


idle_sprite = [
	[spr_char_kris_light_up,spr_char_kris_light_down,spr_char_kris_light_left,spr_char_kris_light_right],
	[spr_char_kris_dark_up,spr_char_kris_dark_down,spr_char_kris_dark_left,spr_char_kris_dark_right]
]
	
move_sprite = [
	[spr_char_kris_light_up,spr_char_kris_light_down,spr_char_kris_light_left,spr_char_kris_light_right],
	[spr_char_kris_dark_up,spr_char_kris_dark_down,spr_char_kris_dark_left,spr_char_kris_dark_right]
]
run_sprite = move_sprite


res_idle_sprite[DIR.UP]=idle_sprite[overworld_mode][0];
res_idle_sprite[DIR.DOWN]=idle_sprite[overworld_mode][1];
res_idle_sprite[DIR.LEFT]=idle_sprite[overworld_mode][2];
res_idle_flip_x[DIR.LEFT]=false;
res_idle_sprite[DIR.RIGHT]=idle_sprite[overworld_mode][3];

res_move_sprite[DIR.UP]=move_sprite[overworld_mode][0];
res_move_sprite[DIR.DOWN]=move_sprite[overworld_mode][1];
res_move_sprite[DIR.LEFT]=move_sprite[overworld_mode][2];
res_move_flip_x[DIR.LEFT]=false;
res_move_sprite[DIR.RIGHT]=move_sprite[overworld_mode][3];



move_speed[DIR.UP]=1.5;
move_speed[DIR.DOWN]=1.5;
move_speed[DIR.LEFT]=1.5;
move_speed[DIR.RIGHT]=1.5;

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
follower = Char_GetTeamObjToArray(); //warning:reverse
//follower = [char_friend,char_kris]
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
