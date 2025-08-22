// Script assets have changed for v2.3.0 see
function Dr_Battle_UseEnemyAct(SLOT,ACT_SLOT,TYPE = 0){
	var Main = dr_battle_main;
	if(instance_exists(Main)){
		var enemy = Dr_Battle_GetEnemy(SLOT)
		var instFunction = enemy.getActEvent(ACT_SLOT,TYPE);
		//var instFunction = enemy.getActEvent(ACT_SLOT,0);
		instFunction();
	}
}