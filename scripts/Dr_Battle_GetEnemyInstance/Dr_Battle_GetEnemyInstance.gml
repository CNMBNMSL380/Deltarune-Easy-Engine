// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyInstance(SLOT){
	var Main = dr_battle_main;
	if(Main._enemy[SLOT] != -1){
		var enemyIns = Main._enemy[SLOT].getIns();
		return enemyIns;
	}
	return noone;
	
}