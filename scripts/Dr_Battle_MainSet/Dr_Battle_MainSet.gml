// Script assets have changed for v2.3.0 see

//		功能性设置
function Dr_Battle_SetStage(STAGE){
	live_ext;
	//show_message("nmsl")
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
	Main._stage = STAGE;
	if(array_length(Main._enemy)){
		if(STAGE == DR_BATTLE_STAGE.PLAYER){
			Main._player_menu = Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
			Main._player_friend_class[_player_friend_num].alarm[0]=1;

			with(dr_battle_char_player){
				event_user(1)
			}
		}
		if(STAGE == DR_BATTLE_STAGE.ACT){
			Dr_Battle_CallDialog("");
			//调用敌人事件与玩家事件
			var goToEvent = Dr_Battle_GetGotoEvent();
			for(var i = 0; i < array_length(goToEvent) ; i++){
				if(goToEvent[i].friend_button == 1){
					var actEvent = goToEvent[i];
					var actChoice = goToEvent[i].friend_choice_act;
					var enemyChoice = goToEvent[i].friend_choice_enemy;
				
					var enemyStrc = Dr_Battle_GetEnemyAct(enemyChoice,actChoice);
					var actBeginEvent = enemyStrc.act_begin_event;
					var actRunEvent = enemyStrc.act_run_event;
				
					////show_message(string(actEvent) + " , " + string(actChoice)+ " , "
					////+ string(enemyChoice)+ " , " + string(enemyStrc)
				
					////)
					//show_message(string(enemyStrc) + " , " + string(actRunEvent))
				
					//执行所有“启动前ACT”事件
					actBeginEvent();
					array_push(Main._player_act_event,actRunEvent);
				}
			}
		
		}
		if(STAGE == DR_BATTLE_STAGE.ITEM){
			Dr_Battle_CallDialog("");
			//调用敌人事件与玩家事件
			var goToEvent = Dr_Battle_GetGotoEvent();
			for(var i = 0; i < array_length(goToEvent) ; i++){
				if(goToEvent[i].friend_button == 1){
					var itemChoice = goToEvent[i].friend_choice_item;
					var friendChoice = goToEvent[i].friend_choice_enemy;
				
					//执行所有“启动前ACT”事件
				}
			}
		
		}
		if(STAGE == DR_BATTLE_STAGE.FIGHT){
			Dr_Battle_CallDialog("");
			//调用敌人事件与玩家事件
			var goToEvent = Dr_Battle_GetGotoEvent();
			var fightSlot = choose(0,1,2);				
			var fightNum = 0;
			var fightMenu = [];
			for(var i = 0; i< array_length(goToEvent) ; i++){
				if(goToEvent[i].friend_button == 0){
					var fightChoice = goToEvent[i].friend_choice_enemy;		
				
					fightMenu[i] = instance_create_depth(0,366 + ( i * 36) + (i * 2),0,dr_battle_menu_fight);
					fightMenu[i].fight_slot = max(0,i - fightSlot);
					fightMenu[i].friend_ins= goToEvent[i].friend_ins;
					fightMenu[i].firend_atk = 10;
					fightMenu[i].friend_ico = goToEvent[i].friend_ins._char_ico;
					fightMenu[i].style_color = goToEvent[i].friend_ins._char_style_color;
					fightMenu[i].enemy_ins = Dr_Battle_GetEnemyInstance(fightChoice);
					fightMenu[i].enemy_def = Dr_Battle_GetEnemyDef(fightChoice);
				
					fightNum++;
				}
			}
			fightMenu[fightNum-1].is_last_ins = true;
		
			show_message(array_length(fightMenu))
			show_message(fightNum)
			//Dr_Battle_SetStageTimeMax(50+( 50 * max(0,fightNum - fightSlot)));
			Dr_Battle_SetStageTimeMax(1000);
			Dr_Battle_SetStageTime()
		}
		if(STAGE == DR_BATTLE_STAGE.DIALOG){
			Dr_Battle_MainDataReset()
		}
		if(STAGE == DR_BATTLE_STAGE.BEFORE_TURN){
			Dr_Battle_CallDialog("")
		
			Dr_Battle_CallEnemyEvent(DR_ENEMY_EVENT.CREATE_TURN);
		}
		if(STAGE == DR_BATTLE_STAGE.DIALOG_TURN){	
			Dr_Battle_CallDialog("")
			Dr_Battle_CallTurnEvent(DR_TURN_EVENT.DIALOG);
		}
		if(STAGE == DR_BATTLE_STAGE.START_TURN){
			Dr_Battle_CallDialog("")
			//启动框张开动画
			var Main = dr_battle_main;
			var BTLborder = dr_battle_board;
			Main._stage_time = 100;
		
			BTLborder.anim_mod = true
			BTLborder.alarm[0] = 1;
		
			//灵魂移动动画
			var soulInst = dr_battle_soul;
			var soulX = soulInst.x;
			var soulY = soulInst.y;
		
			var mainChar = Main._player_friend[0];
			var charX = mainChar.x;
			var charY = mainChar.y - 40;
			Anim_Create(soulInst,"x",0,0,charX,dr_battle_board.x-charX,25);
			Anim_Create(soulInst,"y",0,0,charY,dr_battle_board.y-charY,25);
			Anim_Create(soulInst,"image_alpha",0,0,0,1-0,10);
		
		}
		if(STAGE == DR_BATTLE_STAGE.IN_TRUN){
			Dr_Battle_CallTurnEvent(DR_TURN_EVENT.START_TURN);
		}
		if(STAGE == DR_BATTLE_STAGE.END_TURN){
			Dr_Battle_CallTurnEvent(DR_TURN_EVENT.END_TURN);
		}
		if(STAGE == DR_BATTLE_STAGE.RESET){
			Dr_Battle_CallDialog("")
			var Main = dr_battle_main;
			var BTLborder = dr_battle_board;
			if(instance_exists(dr_battle_turn)){
				BTLborder.anim_mod = false
				BTLborder.alarm[0] = 1;
		
				//灵魂移动动画
				var soulInst = dr_battle_soul;
				var soulX = soulInst.x;
				var soulY = soulInst.y;
		
				var mainChar = Main._player_friend[0];
				var charX = mainChar.x;
				var charY = mainChar.y - 40;
				Anim_Create(soulInst,"x",0,0,soulX,charX-soulX,25);
				Anim_Create(soulInst,"y",0,0,soulY,charY-soulY,25);
				Anim_Create(soulInst,"image_alpha",0,0,1,0-1,0,25);
			
				instance_destroy(dr_battle_turn);
			}
		
		}
		if(STAGE == DR_BATTLE_STAGE.END_BATTLE){
		
		}
	}
	return STAGE
}
function Dr_Battle_ChoicePlayerMenu(BUTTON,MENU = -1,BACK = false){
	live_ext;
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
	switch(BUTTON){
		case -1:
			return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
		break;
		case 0:
			switch(MENU){
				case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
					if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON) }
					else{ Dr_Battle_NextToFriend(BUTTON,MENU,,,Main._player_choice_enemy); }
					
				break;
				default:
					return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY);
				break
			}
		break;
		case 1:
			if(Main._player_friend[Main._player_friend_num]._magic = true){
				switch(MENU){
					case DR_BATTLE_PLAYERMENU.CHOICE_MAGIC:
					
					break;
					default:
						return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_MAGIC);
					break;
				}
			}
			else{
				switch(MENU){
					case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
						if(BACK){ return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON); }
						else{ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_CLASS); }
					break;
					case DR_BATTLE_PLAYERMENU.CHOICE_CLASS:
						if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY); }
						else{ Dr_Battle_NextToFriend(BUTTON,MENU,Main._player_choice_class,,Main._player_choice_enemy); }
							
					break;
					default:
						return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY);
					break;
				}
			}
		break;
		case 2:
			switch(MENU){
				case DR_BATTLE_PLAYERMENU.CHOICE_ITEM:
					if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON) }
					else{ 						
						Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_FRIEND)
					}
				break;
				case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
					
				break;
				case DR_BATTLE_PLAYERMENU.CHOICE_FRIEND:
					
				break;
				default:
					return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ITEM) 
				break;
			}
		break;
		case 3:
			switch(MENU){
				case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
				
				break;
			}
		break;
		case 4:
			switch(MENU){
				case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
				
				break;
			}
		break;
		 
	}
}


function Dr_Battle_SetPlayerMenu(MENU,BUTTON = -1,REFRESH_TEXT = true){
	//这是用于选择设置后触发事件，比如触发打字机什么的	
	live_ext;
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
		
	if(MENU != DR_BATTLE_PLAYERMENU.DEFEND){
		if(MENU == DR_BATTLE_PLAYERMENU.BUTTON){
			if(REFRESH_TEXT){ Dr_Battle_CallDialog(Main._dialogue,Main._dialogue_style,0,false) };			
			Main._player_menu = MENU
			
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_ENEMY){
			// ---------选择敌人
			Dr_Battle_CallDialog(Dr_Battle_GetAllEnemyName(),Main._dialogue_style,1,true);	
			Main._player_menu = MENU
			UI.choice_num = _player_choice_enemy;
			
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_CLASS){
			// ---------行动
			Dr_Battle_CallDialog(Dr_Battle_GetAllEnemyActName(Main._player_choice_enemy),Main._dialogue_style,2,true);	
			Main._player_menu = MENU
			UI.choice_num = _player_choice_class;
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_MAGIC){
			Dr_Battle_CallDialog(Main.get_EnemyActName(),Main._dialogue_style,2,true);	
			Main._player_menu = MENU
			UI.choice_num = _player_choice_magic;
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_ITEM){
			Dr_Battle_CallDialog(Item_GetNameAll(),Main._dialogue_style,2,true);	
			Main._player_menu = MENU
			UI.choice_num = _player_choice_item;
		}
		else{
			Dr_Battle_CallDialog("",,-1,false);		
		}
	}
	return MENU;
}

//	----	普通设置
function Dr_Battle_SetStageTimeMax(TIME = 100){
	live_ext;
	var Main = dr_battle_main;
	Main._stage_timeMax = TIME;
}
function Dr_Battle_SetStageTime(TIME = -2){
	live_ext;
	var Main = dr_battle_main
	if(TIME == -2){
		Main._stage_time = Main._stage_timeMax;
	}
	else{
		Main._stage_time = TIME;
	}
	return true;
	
}
