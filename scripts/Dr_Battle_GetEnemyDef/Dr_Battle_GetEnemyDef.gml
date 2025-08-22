// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyDef(SLOT){
	var Main = dr_battle_main;
	var enemyIns = Main._enemy[SLOT].getDef();
	
	return enemyIns;
}