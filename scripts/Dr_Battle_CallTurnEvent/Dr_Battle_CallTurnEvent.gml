// Script assets have changed for v2.3.0 see
function Dr_Battle_CallTurnEvent(EVENT){
	if(instance_exists(dr_battle_turn)){
		with(dr_battle_turn){
			event_user(EVENT);
		}	
		return true;
	}
	return false;
}