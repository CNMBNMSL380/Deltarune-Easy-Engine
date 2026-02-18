// Script assets have changed for v2.3.0 see
 function Dr_Battle_MainUserFightMenu(){
	var Main = dr_battle_main;
	var goToEvent = Dr_Battle_GetGotoEvent();
	var fightSlot = choose(0,1,2);				
	var fightInstance = [];
	var fightInstancePart = [];
	var is_empty = true
	for(var i = 0; i < array_length(goToEvent) ; i++){
		//如果按钮为攻击按钮
		if(goToEvent[i].friend_button == 0){
				//如果没有检测到对象，则跳过
				var fightChoice = goToEvent[i].friend_choice_enemy;		
				var enemyInst = Dr_Battle_GetEnemyInstance(fightChoice);
				var c = choose(irandom_range(true,false),irandom_range(true,false));
				var fightMenu = instance_create_depth(0,366 + ( i * 36) + (i * 2),0,dr_battle_menu_fight);
				fightMenu.fight_slot = i;
				fightMenu.friend_ins= goToEvent[i].friend_ins;
				fightMenu.firend_atk = Char_GetTeamAtk(fightMenu.fight_slot);
				fightMenu.friend_ico = goToEvent[i].friend_ins._char_ico;
				fightMenu.style_color = goToEvent[i].friend_ins._char_style_color;
				fightMenu.enemy_slot = goToEvent[i].friend_choice_enemy;
				fightMenu.enemy_ins = Dr_Battle_GetEnemyInstance(fightChoice)
				fightMenu.enemy_def = Dr_Battle_GetEnemyDef(goToEvent[i].friend_choice_enemy);
				
				//添加进临时实例
				array_push(fightInstancePart,fightMenu);
				
				if(c and array_length(fightInstancePart) != 0){				
					array_push(fightInstance,fightInstancePart);
					fightInstancePart = [];
				}
				
				is_empty = false			
			}
	}
	//------------补上最后的战斗数组
	if(array_length(fightInstancePart) != 0){
		array_push(fightInstance,fightInstancePart);
	}
	//-----------是否交叉
		/*
			注意！最开始这上面套方法他根本无法让两个判断条实现交叉
			所以我自己写了套交叉，不过你也看到了，这一下他根本无法再
			支持4个队友以上，因为这也会....报错（我还没测试，推测的）
			如果你要弄4个队友以上的战斗，你最好把交叉那部分代码注释掉
			或者你有更好的经验，写个更好的位移判断条
		*/
		if(array_length(fightInstance) == 2){
			for(var i = 0; i< array_length(fightInstance) ; i++){
				if(array_length(fightInstance[i]) == 2){
					if(i == 0){
						var p = fightInstance[i][1];
						array_shift(fightInstance[i]);
						array_push(fightInstance[i+1],p);
					}
					else if(i == 1){
						var p = fightInstance[i][1];
						array_pop(fightInstance[i]);
						array_push(fightInstance[i-1],p);
					}	
				}
			}
		}
	
	//---------------打乱数组
	var finally_arr = array_shuffle(fightInstance);
	show_debug_message("打乱 : " + string( finally_arr));
	
	//---------------给每个战斗实例重新打上id
	for(var i=0 ; i< array_length(finally_arr);i++){
		for (var j = 0; j < array_length(finally_arr[i]); j++) {
		    finally_arr[i][j].fight_slot = i;
		}
	}
	
	Main._fight_menu_inst = finally_arr;
	
	if(!is_empty){
		//Dr_Battle_SetStageTimeMax(50+( 50 * max(0,fightNum - fightSlot)));
		Dr_Battle_SetStageTime(300)
	}
	else{
		Dr_Battle_SetStageTime(0)
	}
	return true
}