// Script assets have changed for v2.3.0 see
function Dr_Battle_DestroyEnemy(SLOT){
	var Main = dr_battle_main
	var mainEnemy = Dr_Battle_GetEnemyAll()
	//查找是否有敌人，如果找到则进行销毁
	for(var i = 0 ; i < array_length(mainEnemy) ; i++){	
		var enemy = Dr_Battle_GetEnemy(i);
		var enemyIns = enemy .getIns();
		if( enemyIns._enemy_id ==  SLOT){
			Dr_Battle_EnemyFunc(SLOT,DR_BATTLE_ENEMY.DELETE);
			instance_destroy( enemyIns);
			array_delete(Main._enemy,i,1);
		}
	}
	//重新排列敌人数组，以防止发生错位
	for(var i = 0 ; i < array_length(Main._enemy); i++){
		Main._enemy[i].setSlot(i);
		Main._enemy[i].getIns()._enemy_id = i;
		
	}
	
	return true;
}