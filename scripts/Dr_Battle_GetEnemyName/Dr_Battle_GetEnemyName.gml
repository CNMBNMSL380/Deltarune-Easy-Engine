// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyName(SLOT){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		var Name = "";
		for(var i =0 ; i < array_length(Main) ; i++){
			if(Main[i].getSlot() == SLOT){
				name = enemy[i].getName();	
			}
		}
		return Name;
	}
	return "null";
}
function Dr_Battle_GetAllEnemyName(){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		var Name = [];
		for(var i =0 ; i < array_length(Main) ; i++){
			if(Main != -1){
				array_push(Name,Main[i].getName());
			}
		}
		return Name;
	}
	return ["W!null"];
}  