// Script assets have changed for v2.3.0 see

// !----------后期需要修改！
//与Char_HurtYourFirend 不同的事，他会连同一些效果一并触发，比如角色受伤特效，和一些东西巴拉巴拉的

function Dr_Battle_HurtYourFriend(SLOT = -1, DAMG = 0 , ANIM = true){
	var Main = dr_battle_main;
	slot = SLOT;
	if(SLOT == -1){
		for(var i =0; i < array_length(Main._player_friend) ; i++){
			// 令队友受到伤害
			Char_HurtYourFriendInTeam(i,DAMG,true);
			//呼叫所有队友执行受伤动作
			Dr_Battle_SetFriendSpriteMode(,DR_PLAYER_INDEX.HURT);
			//生成伤害实例
			var damInst = instance_create_depth(Main._player_friend[i].x,Main._player_friend[i].y-75,0,dr_battle_menu_damageNum);
			damInst.dam_num = DAMG
			//恢复动作
			var func = function(){
				Dr_Battle_SetFriendSpriteMode(,DR_PLAYER_INDEX.IDLE);
			}
			MyAlarm_Add("Hurt : " + string(i),func,50);
		}
	}
	else{	
		Char_HurtYourFriendInTeam(SLOT,DAMG,true);
		
		Dr_Battle_SetFriendSpriteMode(Main._player_friend[SLOT],DR_PLAYER_INDEX.HURT);
		
		var damInst = instance_create_depth(Main._player_friend[SLOT].x,Main._player_friend[SLOT].y-75,0,dr_battle_menu_damageNum);
		damInst.dam_num = DAMG
		
		var func = function(){
			var Main = dr_battle_main;
			Dr_Battle_SetFriendSpriteMode(Main._player_friend[slot],DR_PLAYER_INDEX.IDLE);
		}
		MyAlarm_Add("Hurt : " + string(SLOT),func,50);
	}
}