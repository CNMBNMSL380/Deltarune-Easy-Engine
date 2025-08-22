// Script assets have changed for v2.3.0 see

// -----------获取敌人系列的所有数组
function Dr_Battle_GetEnemy(SLOT){
	var Main = dr_battle_main
	return Main._enemy[SLOT];
}
function Dr_Battle_GetEnemyAll(){
	var Main = dr_battle_main
	return Main._enemy
}