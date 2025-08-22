// Script assets have changed for v2.3.0 see
function Dr_Battle_SetEnemyActBeginEvent(SLOT,ACT_SLOT,FUN = function(){} ){
	var Main = dr_battle_main
	if(instance_exists(Main)){
		var enemyAct = Dr_Battle_GetEnemyAct(SLOT,ACT_SLOT);
		enemyAct.setActEvent(ACT_SLOT,FUN);		
	}
	
}