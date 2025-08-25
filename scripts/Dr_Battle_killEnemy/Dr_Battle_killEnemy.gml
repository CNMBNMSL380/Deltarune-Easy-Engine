// Script assets have changed for v2.3.0 see
function Dr_Battle_killEnemy(SLOT){
	var Main = dr_battle_main
	var mainEnemy = Dr_Battle_GetEnemyAll()
	
	for(var i = 0 ; i < array_length(mainEnemy) ; i++){	
		var enemy = Dr_Battle_GetEnemy(i);
		var enemyIns = enemy .getIns();
		if( enemyIns._enemy_id ==  SLOT){
			instance_destroy( enemyIns);
			array_delete(Main._enemy,i,1);
		}
	}
	for(var i = 0 ; i < array_length(Main._enemy); i++){
		Main._enemy[i].setSlot(i);
		Main._enemy[i].getIns()._enemy_id = i;
		
	}
	
	return true;
}