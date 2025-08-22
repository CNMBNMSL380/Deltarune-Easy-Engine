// Script assets have changed for v2.3.0 see
function Dr_Battle_CallEnemyEvent(EVENT,SLOT = -1){
	var Main = dr_battle_main
	if(instance_exists(Main)){
		if(SLOT == -1){
			with(dr_battle_enemy){
				event_user(EVENT);
			}	
		}
		else{
			with(Main._enemy[SLOT].getIns()){
				
				event_user(EVENT);
			}
		}
		return true;
	}
	return false;
	
}