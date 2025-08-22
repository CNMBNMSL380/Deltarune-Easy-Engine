// Script assets have changed for v2.3.0 see
function Dr_Battle_SetEnemyName(SLOT,NAME){
	if(instance_exists(dr_battle_main)){
		var enemy = dr_battle_main._enemy;
		var name = NAME;
		enemy[SLOT].setName(name);	

		return true;
	}
	return false;
}