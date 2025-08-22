event_inherited();

if(Dr_Battle_GetStage()==DR_BATTLE_STAGE.IN_TRUN && moveable){
	if(xprevious = x&&yprevious = y){
		global.is_moving = 0;
	}
	else{
		global.is_moving = 1;
	}
}
else{
	global.is_moving = 0;
}