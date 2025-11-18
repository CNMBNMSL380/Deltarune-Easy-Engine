// Script assets have changed for v2.3.0 see
function Dr_Battle_GetEnemyName(SLOT,SPARE_FX = false){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		var name = "";
		for(var i =0 ; i < array_length(Main) ; i++){
			if(Main[i].getSlot() == SLOT){
				var spare_text = "";
				if(SPARE_FX){
					var emy_spare = Main[i].getIns().spare;
					if(emy_spare >=100){
						spare_text = "{color `yellow`}"
					}
				}
				name = spare_text + Main[i].getName();		
			}
		}
		return name;
	}
	return "null";
}
function Dr_Battle_GetAllEnemyName(SPARE_FX = false){
	if(instance_exists(dr_battle_main)){
		var Main = dr_battle_main._enemy;
		var name = [];
		for(var i =0 ; i < array_length(Main) ; i++){
			if(Main != -1){
				array_push(name,Dr_Battle_GetEnemyName(i,true));
			}
		}
		return name;
	}
	return ["W!null"];
}  