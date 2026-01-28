/// @description 事件
live;

// Inherit the parent event
event_inherited();

//idle_sprite = [
//	[spr_char_kris_light_up,spr_char_kris_light_down,spr_char_kris_light_left,spr_char_kris_light_right],
//	[spr_char_kris_dark_up,spr_char_kris_dark_down,spr_char_kris_dark_left,spr_char_kris_dark_right]
//];
//move_sprite = [
//	[spr_char_kris_light_up,spr_char_kris_light_down,spr_char_kris_light_left,spr_char_kris_light_right],
//	[spr_char_kris_dark_up,spr_char_kris_dark_down,spr_char_kris_dark_left,spr_char_kris_dark_right]
//];

idle_sprite =[spr_char_kris_dark_up,spr_char_kris_dark_down,spr_char_kris_dark_left,spr_char_kris_dark_right];
move_sprite = [spr_char_kris_dark_up,spr_char_kris_dark_down,spr_char_kris_dark_left,spr_char_kris_dark_right];
run_sprite = move_sprite;

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
