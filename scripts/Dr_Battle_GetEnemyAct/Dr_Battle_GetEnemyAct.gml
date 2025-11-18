// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyAct(SLOT,ACT_SLOT){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		if(SLOT < array_length(Main)){
			return Main[SLOT].getAct(ACT_SLOT);
		}
		else{
			return false;
		}
		
	}
	return false
}
function Dr_Battle_GetEnemyActAll(SLOT){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main;
		var enemyAct =Main._enemy[SLOT].getActAll();
		return enemyAct;
	}
	return false
}