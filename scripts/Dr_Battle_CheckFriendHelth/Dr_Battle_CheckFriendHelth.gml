// Script assets have changed for v2.3.0 see
function Dr_Battle_CheckFriendHelth(SLOT = -1,HEAL = false){
	//用于检查每个角色的健康值，然后对此做出回应
	var Main = dr_battle_main;
	var base = undefined;
	if(SLOT == -1){
		for(var i = 0; i < array_length(Char_GetTeam()); i++){
			base = Dr_Battle_GetSpriteListBase(Main._player_friend[i]);
			if(base != undefined){
				if(Char_GetTeamHp(i) <= 0){			
					if(Dr_Battle_GetSpriteMode( base ) != DR_PLAYER_INDEX.DEFEATE){
						Dr_Battle_SetSpriteMode(base,DR_PLAYER_INDEX.DEFEATE)
					}				
					if(HEAL){
						Dr_Battle_HealYourFriend(i,irandom_range(10,20));
					}
				}
			}
			else{
				show_debug_message("Dr_Battle_CheckFriendHelth: 未找到指定的base，值"+ string(i));	
			}
		}
	}
	else{
		base = Dr_Battle_GetSpriteListBase(Main._player_friend[i]);
		if(base != undefined){
			if(Char_GetTeamHp(SLOT) <= 0){			
				if(Dr_Battle_GetSpriteMode( base ) != DR_PLAYER_INDEX.DEFEATE){
					Dr_Battle_SetSpriteMode(base,DR_PLAYER_INDEX.DEFEATE)
				}				
				if(HEAL){
					Dr_Battle_HealYourFriend(SLOT,irandom_range(10,20));
				}
			}
		}
		else{
			show_debug_message("Dr_Battle_CheckFriendHelth: 未找到指定的base，值"+ string(SLOT));	
		}
	}
	
	
}