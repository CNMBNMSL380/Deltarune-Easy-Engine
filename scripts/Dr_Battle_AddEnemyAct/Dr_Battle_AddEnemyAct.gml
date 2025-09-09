// Script assets have changed for v2.3.0 see
function Dr_Battle_AddEnemyAct(SLOT,NAME,INFO = "",EVENT = function(){},BEG_EVENT = function(){},ED_EVENT= function(){},CAN_DO_CHAR = [],USETP = 0){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main;
		if(SLOT < array_length(Main._enemy)){
			Main._enemy[SLOT].addAct(SLOT,NAME,INFO,EVENT,BEG_EVENT,ED_EVENT,CAN_DO_CHAR,USETP);
			//show_message(Main._enemy[SLOT])
			return Main._enemy[SLOT];
		}
		else{
			return false;
		}		
	}
	return false
}