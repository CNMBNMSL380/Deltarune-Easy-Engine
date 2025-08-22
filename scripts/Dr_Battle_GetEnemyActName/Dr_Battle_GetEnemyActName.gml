// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyActName(SLOT,ACT_SLOT){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		var Name = "";
		if(SLOT < array_length(Main)){
			Name = Main[SLOT].getActName(ACT_SLOT);
			return Name;
		}
		else{
			return "null";
		}
		
	}
	return false
}

function Dr_Battle_GetAllEnemyActName(SLOT){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy[SLOT]	
		var Name = [];
		for(var i =0 ; i < array_length(Main.enemy_act) ; i++){
			array_push(Name,Dr_Battle_GetEnemyActName(SLOT,i))
		}
		return Name;
	}
	return false
}