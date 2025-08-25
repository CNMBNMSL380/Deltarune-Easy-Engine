// Script assets have changed for v2.3.0 see
function Dr_Battle_GetStage(){
	var Main = dr_battle_main;
	if(instance_exists(Main)){
		return Main._stage;
	}
	return false;
	
}
function Dr_Battle_GetGotoEvent(){
	var Main = dr_battle_main;
	if(instance_exists(Main)){
		return Main._player_GoToEvent
	}
	return false;
}
function Dr_Battle_GetTp(){
	var Main = dr_battle_main;
	if(instance_exists(Main)){
		return Main._player_tp;
	}
	return false;	
}

function Dr_Battle_GetPlayerChoiceEnemy(){
	var Main = dr_battle_main;
	if(instance_exists(Main)){
		return Main._player_choice_enemy;
	}
	return false;
}
