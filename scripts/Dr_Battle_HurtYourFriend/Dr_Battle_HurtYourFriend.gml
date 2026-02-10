// Script assets have changed for v2.3.0 see

// !----------后期需要修改！
//与Char_HurtYourFirend 不同的事，他会连同一些效果一并触发，比如角色受伤特效，和一些东西巴拉巴拉的

function Dr_Battle_HurtYourFriend(SLOT = -1, DAMG = 0 , ANIM = true){
	var Main = dr_battle_main;
	slot = SLOT;
	if(SLOT == -1){
		for(var i =0; i < array_length(Main._player_friend) ; i++){
			if((Char_GetTeamHp(i) - DAMG) >= 0 ){						
				//呼叫所有队友执行受伤动作
				Dr_Battle_SetSpriteMode(,DR_PLAYER_INDEX.HURT);
				//恢复动作
				var func = function(){
					Dr_Battle_SetSpriteMode(,DR_PLAYER_INDEX.IDLE);
				}
				MyAlarm_Add("Hurt : " + string(i),func,50);
			}
			else{
				Dr_Battle_SetSpriteMode(,DR_PLAYER_INDEX.DEFEATE);
			}
			// 令队友受到伤害
			Char_HurtYourFriendInTeam(i,DAMG,true);
			//生成伤害实例	
			var damInst = instance_create_depth(Main._player_friend[i].x,Main._player_friend[i].y-75,0,dr_battle_menu_damageNum);
				damInst.dam_num = DAMG;
		}
	}
	else{	
		if((Char_GetTeamHp(SLOT) - DAMG) >= 0 ){						
			//呼叫所有队友执行受伤动作
			Dr_Battle_SetSpriteMode(,DR_PLAYER_INDEX.HURT);
			//恢复动作
			var func = function(){
				Dr_Battle_SetSpriteMode(slot,DR_PLAYER_INDEX.IDLE);
			}
			MyAlarm_Add("Hurt : " + string(SLOT),func,50);
		}
		else{
			Dr_Battle_SetSpriteMode(,DR_PLAYER_INDEX.DEFEATE);
		}
		// 令队友受到伤害
		Char_HurtYourFriendInTeam(SLOT,DAMG,true);
		//生成伤害实例	
		var damInst = instance_create_depth(Main._player_friend[SLOT].x,Main._player_friend[SLOT].y-75,0,dr_battle_menu_damageNum);
		damInst.dam_num = DAMG;
	}
}