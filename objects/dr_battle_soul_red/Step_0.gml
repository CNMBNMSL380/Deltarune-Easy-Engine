event_inherited();

//移动
var STATE=Dr_Battle_GetStage();
if(STATE==DR_BATTLE_STAGE.IN_TRUN && moveable){
	var SPD=Player_GetSpdTotal()
	var SPD=(Input_IsHeld(INPUT.CANCEL) ? SPD/2 : SPD);
	repeat(SPD*10){
		if(Input_IsHeld(INPUT.UP)){
			if(!position_meeting(x,y-sprite_height/2,block)){
				y-=0.1;
			}
		}
		if(Input_IsHeld(INPUT.DOWN)){
			if(!position_meeting(x,y+sprite_height/2,block)){
				y+=0.1;
			}
		}
		if(Input_IsHeld(INPUT.LEFT)){
			if(!position_meeting(x-sprite_width/2,y,block)){
				x-=0.1;
			}
		}
		if(Input_IsHeld(INPUT.RIGHT)){
			if(!position_meeting(x+sprite_width/2,y,block)){
				x+=0.1;
			}
		}
	}
}