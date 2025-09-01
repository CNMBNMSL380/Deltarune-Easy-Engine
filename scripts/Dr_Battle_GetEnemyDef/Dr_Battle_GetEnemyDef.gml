// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyDef(SLOT){
	var Main = dr_battle_main;
	var enemyIns = Main._enemy[SLOT].getDef();
	
	return enemyIns;
}
function Dr_Battle_GetEnemyDefByInstance(INSTANCE){
	var Main = dr_battle_main;
	var enemyIns = 0;
	for(var i =0; i< array_length(Main._enemy) ; i++){
		if(Main._enemy[i].getIns == INSTANCE){
			enemyIns = Main._enemy[i].getDef();
			return enemyIns
		}
	}
	
	show_debug_message("Dr_Battle_GetEnemyDefByInstance : 获取失败-已自动设置为0")
	return 0 ;
}