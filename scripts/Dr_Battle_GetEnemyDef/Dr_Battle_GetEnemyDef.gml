// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyDef(SLOT){
	var Main = dr_battle_main;
	if(SLOT < array_length(Main._enemy)){
		var enemyIns = Main._enemy[SLOT].getDef();
		return enemyIns;
	}
	show_debug_message("Dr_Battle_GetEnemyDefByInstance : 获取失败-已自动设置为0")
	return 0;
}