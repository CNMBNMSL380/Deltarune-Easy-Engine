//if(){	
var STATE=Dr_Battle_GetStage();
	if(STATE==DR_BATTLE_STAGE.IN_TRUN ){
		if(follow_board){
			x+=dr_battle_board.x-dr_battle_board.xprevious;
			y+=dr_battle_board.y-dr_battle_board.yprevious;
		}
	
		while(position_meeting(x+sprite_width/2,y,block)){
			x-=0.01;
		}
		while(position_meeting(x-sprite_width/2,y,block)){
			x+=0.01;
		}
		while(position_meeting(x,y+sprite_height/2,block)){
			y-=0.01;
		}
		while(position_meeting(x,y-sprite_height/2,block)){
			y+=0.01;
		}
	}
//}
//无敌时间闪烁
if(global._inv>0){
	global._inv-=1;
	if(image_speed==0){
		image_speed=1/2;
		image_index=1;
	}
}else{
	if(image_speed!=0){
		image_speed=0;
		image_index=0;
	}
}