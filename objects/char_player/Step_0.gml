live;
var can_move=(moveable&&_moveable_dialog&&_moveable_menu&&_moveable_save&&_moveable_warp&&_moveable_encounter&&_moveable_box);
//overworld_mode = 1;
if(can_move){
	if(Input_IsHeld(INPUT.CANCEL)&&(move[0] > 0||move[90] > 0||move[180] > 0||move[270] > 0)){
	 	move_speed[DIR.UP]=3;
		move_speed[DIR.DOWN]=3;
		move_speed[DIR.LEFT]=3;
		move_speed[DIR.RIGHT]=3;
		res_move_sprite[DIR.UP]=run_sprite[overworld_mode][0];
		res_move_sprite[DIR.DOWN]=run_sprite[overworld_mode][1];
		res_move_sprite[DIR.LEFT]=run_sprite[overworld_mode][2];
		res_move_sprite[DIR.RIGHT]=run_sprite[overworld_mode][3];
		sprite_index = res_move_sprite[dir];
	}else{
		move_speed[DIR.UP]=2;
		move_speed[DIR.DOWN]=2;
		move_speed[DIR.LEFT]=2;
		move_speed[DIR.RIGHT]=2;
		res_move_sprite[DIR.UP]=move_sprite[overworld_mode][0];
		res_move_sprite[DIR.DOWN]=move_sprite[overworld_mode][1];
		res_move_sprite[DIR.LEFT]=move_sprite[overworld_mode][2];
		res_move_sprite[DIR.RIGHT]=move_sprite[overworld_mode][3];
		sprite_index = res_move_sprite[dir];
	}
	if(Input_IsHeld(INPUT.UP)){
		move[DIR.UP]=2;
	}else if(Input_IsHeld(INPUT.DOWN)){
		move[DIR.DOWN]=2;
	}
	if(Input_IsHeld(INPUT.LEFT)){
		move[DIR.LEFT]=2;
	}else if(Input_IsHeld(INPUT.RIGHT)){
		move[DIR.RIGHT]=2;
	}
	if(Input_IsPressed(INPUT.CONFIRM)){
		var inst=noone;
		if(dir==DIR.UP){
			inst=collision_rectangle(x-sprite_width/2+4,y-5,x+sprite_width/2-4,y-sprite_height+5,char,false,true);
		}
		if(dir==DIR.DOWN){
			inst=collision_rectangle(x-sprite_width/2+4,y-sprite_height+20,x+sprite_width/2-4,y+15,char,false,true);
		}
		if(dir==DIR.LEFT){
			inst=collision_rectangle(x,y-sprite_height+19,x+sprite_width/2-15,y,char,false,true);
		}
		if(dir==DIR.RIGHT){
			inst=collision_rectangle(x,y-sprite_height+19,x+sprite_width/2+15,y,char,false,true);
		}
		if(instance_exists(inst)){
			if(inst != char_friend){
				with(inst){
					event_user(0);
				}
			}
		}
	}
	if(!instance_exists(ui_dialog) and ! instance_exists(dr_battle_main)){
		if(Input_IsPressed(INPUT.MENU)){
			instance_create_depth(0,0,0,ui_menu);
		}
	}
}

event_inherited();