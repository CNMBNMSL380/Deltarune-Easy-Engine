//@arg sneaking
function Player_SetSneaking(){
	var S = argument[0];
	Flag_Set(FLAG_STATIC,"sneaking",S);
	if(S = 0){
		with(char_player){
			sneak_intro_image = 0;
			mode = 0;
			
			res_idle_sprite[DIR.UP]=spr_char_kowerd_up;
			res_idle_sprite[DIR.DOWN]=spr_char_kowerd_down;
			res_idle_sprite[DIR.LEFT]=spr_char_kowerd_left;
			res_idle_sprite[DIR.RIGHT]=spr_char_kowerd_right;
			res_move_sprite[DIR.UP]=spr_char_kowerd_up;
			res_move_sprite[DIR.DOWN]=spr_char_kowerd_down;
			res_move_sprite[DIR.LEFT]=spr_char_kowerd_left;
			res_move_sprite[DIR.RIGHT]=spr_char_kowerd_right;
			
			sprite_index=res_idle_sprite[dir];
	
			move_speed[DIR.UP]=1.5;
			move_speed[DIR.DOWN]=1.5;
			move_speed[DIR.LEFT]=1.5;
			move_speed[DIR.RIGHT]=1.5;
		}
			
		camera.scale_x = 2;
		camera.scale_y = 2;
	}
	else{
		with(char_player){
			res_idle_sprite[DIR.UP]=spr_char_kowerd_up_sneak_idle;
			res_idle_sprite[DIR.DOWN]=spr_char_kowerd_down_sneak_idle;
			res_idle_sprite[DIR.LEFT]=spr_char_kowerd_left_sneak_idle;
			res_idle_sprite[DIR.RIGHT]=spr_char_kowerd_right_sneak_idle;
			res_move_sprite[DIR.UP]=spr_char_kowerd_up_sneak;
			res_move_sprite[DIR.DOWN]=spr_char_kowerd_down_sneak;
			res_move_sprite[DIR.LEFT]=spr_char_kowerd_left_sneak;
			res_move_sprite[DIR.RIGHT]=spr_char_kowerd_right_sneak;
			
			sprite_index=res_idle_sprite[dir];
	
			move_speed[DIR.UP]=0.5;
			move_speed[DIR.DOWN]=0.5;
			move_speed[DIR.LEFT]=0.5;
			move_speed[DIR.RIGHT]=0.5;
			
			mode = 0;
		}
		camera.scale_x = 2.5;
		camera.scale_y = 2.5;
	}
}