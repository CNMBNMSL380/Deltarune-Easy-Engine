// Script assets have changed for v2.3.0 see
 function Dr_Battle_MainUserFightMenu(){
	var goToEvent = Dr_Battle_GetGotoEvent();
	var fightSlot = choose(0,1,2);				
	var fightMenu = [];
	var is_empty = true
	for(var i = 0; i< array_length(goToEvent) ; i++){
		//如果按钮为攻击按钮
		if(goToEvent[i].friend_button == 0){
				//如果没有检测到对象，则跳过
				var fightChoice = goToEvent[i].friend_choice_enemy;		
				var enemyInst = Dr_Battle_GetEnemyInstance(fightChoice);
				if(enemyInst == noone){
					enemyInst =  Dr_Battle_GetEnemyInstance(0);
				}
			
				fightMenu[i] = instance_create_depth(0,366 + ( i * 36) + (i * 2),0,dr_battle_menu_fight);
				fightMenu[i].fight_slot = max(0,i - fightSlot);
				fightMenu[i].friend_ins= goToEvent[i].friend_ins;
				fightMenu[i].firend_atk = 10;
				fightMenu[i].friend_ico = goToEvent[i].friend_ins._char_ico;
				fightMenu[i].style_color = goToEvent[i].friend_ins._char_style_color;
				fightMenu[i].enemy_ins = enemyInst
				fightMenu[i].enemy_def = Dr_Battle_GetEnemyDef(goToEvent[i].friend_choice_enemy);
				if( i < array_length(goToEvent) -1){
					fightMenu[i].is_last_ins = true;
				}
				is_empty = false
					
			}
	}
	if(!is_empty){
		//Dr_Battle_SetStageTimeMax(50+( 50 * max(0,fightNum - fightSlot)));
		Dr_Battle_SetStageTime(1000)
	}
	else{
		Dr_Battle_SetStageTime(0)
	}
	return true
}