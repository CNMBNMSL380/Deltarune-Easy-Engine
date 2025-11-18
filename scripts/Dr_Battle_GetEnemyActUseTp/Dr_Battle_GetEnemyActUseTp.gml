// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyActUseTp(SLOT,ACT_SLOT){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		if(SLOT < array_length(Main)){
			return Main[SLOT].getAct(ACT_SLOT).act_useTp;
		}
		else{
			return 0;
		}
		
	}
	return 0;		
}