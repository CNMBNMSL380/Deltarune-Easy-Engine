// Script assets have changed for v2.3.0 see

//		功能性设置
function Dr_Battle_SetStage(STAGE){
	live_ext;
	//show_message("nmsl")
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
	Main._stage = STAGE;
	if(STAGE == DR_BATTLE_STAGE.PLAYER){
		Main._player_menu = Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
		Main._player_friend_class[_player_friend_num].alarm[0]=1;			
	}
	if(STAGE == DR_BATTLE_STAGE.ACT){
		Dr_Battle_CallDialog("");
		//调用敌人事件与玩家事件
		var goToEvent = Dr_Battle_GetGotoEvent();
		for(var i = 0; i < array_length(goToEvent) ; i++){
			//如果事件按钮是ACT且队友使用的不是魔法
			if(goToEvent[i].friend_button == 1 and goToEvent[i].friend_ins._magic == false){
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
				array_push(Main._player_act_event,[actRunEvent,enemyChoice,actChoice]);
			}
		}
		
	}
	if(STAGE == DR_BATTLE_STAGE.MAGIC){
		Dr_Battle_CallDialog("");
		//调用敌人事件与玩家事件
		var goToEvent = Dr_Battle_GetGotoEvent();
		for(var i = 0; i < array_length(goToEvent) ; i++){
			//如果事件按钮是ACT且队友使用的是魔法
			if(goToEvent[i].friend_button == 1 and goToEvent[i].friend_ins._magic){
				var magicChoice = goToEvent[i].friend_choice_magic;
				var enemyChoice = goToEvent[i].friend_choice_enemy;			
				var friendChoice = goToEvent[i].friend_choice_friend;			
				
				var magicEvent = {
					slot : goToEvent[i].friend_slot,
					magic : goToEvent[i].friend_choice_magic,
					char_name : Dr_Battle_GetFriendName(goToEvent[i].friend_slot),
					choice : [enemyChoice,friendChoice]
				}
								
				array_push(Main._player_magic_event,magicEvent);
				//Char_UseMagic(1,magicEvent.friend_slot,magicChoice,[enemyChoice,friendChoice]);
			}
		}
	}
	if(STAGE == DR_BATTLE_STAGE.MERCY){
		Dr_Battle_CallDialog("");
		//调用敌人事件与玩家事件
		var goToEvent = Dr_Battle_GetGotoEvent();
		for(var i = 0; i < array_length(goToEvent) ; i++){
			if(goToEvent[i].friend_button == 3){
				var mercyEvent = {
					slot: goToEvent[i].friend_slot,
					enemy : goToEvent[i].friend_choice_enemy
				}
				array_push(Main._player_mercy_event,mercyEvent);
			}
		}
		
	}
	if(STAGE == DR_BATTLE_STAGE.ITEM){
		Dr_Battle_CallDialog("");
		//调用敌人事件与玩家事件
		var goToEvent = Dr_Battle_GetGotoEvent();
		for(var i = 0; i < array_length(goToEvent) ; i++){
			if(goToEvent[i].friend_button == 2){				
				var itemChoice = goToEvent[i].friend_choice_item;
				var enemyChoice = goToEvent[i].friend_choice_enemy;			
				var friendChoice = goToEvent[i].friend_choice_friend;		
				
				var itemEvent = {
					slot : goToEvent[i].friend_slot,
					_item_slot : itemChoice,
					_item : Item_Get(itemChoice),
					choice : [enemyChoice,friendChoice]
				}
				array_push(Main._player_item_event,itemEvent);		
				
			}
		}
		Dr_Battle_SetStageTimeMax(15);
	
	}
	if(STAGE == DR_BATTLE_STAGE.FIGHT){
		Dr_Battle_CallDialog("");
		//调用敌人事件与玩家事件
		Dr_Battle_MainUserFightMenu()
			
	}
	if(STAGE == DR_BATTLE_STAGE.DIALOG){
		//Dr_Battle_MainDataReset()
	}
	if(STAGE == DR_BATTLE_STAGE.BEFORE_TURN){
		Dr_Battle_CallDialog("")	
		Dr_Battle_CallEnemyEvent(DR_BATTLE_ENEMY.CREATE_TURN);
		
	}
	if(STAGE == DR_BATTLE_STAGE.DIALOG_TURN){	
		Dr_Battle_CallDialog("")
		Dr_Battle_CallTurnEvent(DR_TURN_EVENT.START_TURN);
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
		Dr_Battle_CallDialog("你赢了！获得一堆钱钱和经验值",,3);
		
		//Dr_Battle_CallEnemyEvent(0);
		//Dr_Battle_CallFriendEvent(DR_BATTLE_ENEMY);
	}
	if(STAGE == DR_BATTLE_STAGE.BLACK){		
		Anim_Create(dr_battle_ui,"pos_y",2,1,0,180,25)	
		var Main = dr_battle_main;
		Main.alarm[2] = 1;
		
	}
	
	return STAGE
}
function Dr_Battle_ChoicePlayerMenu(BUTTON,MENU = -1,BACK = false){
	live_ext;
	var Main = dr_battle_main;
	var UI = dr_battle_ui;
	switch(BUTTON){
		case -1://返回选择选项界面
			return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
		break;
		case 0://攻击
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
		case 1://行动 / 魔法
			//检测
			if(Main._player_friend[Main._player_friend_num]._magic = true){
				switch(MENU){
					case DR_BATTLE_PLAYERMENU.CHOICE_MAGIC:
						if(BACK){ return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON); }
						else{ 
							if(!Char_GetMagicMod(1,Main._player_friend_num -1 ,Main._player_choice_magic)){
								Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY); 
							}
							else{
								Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_FRIEND); 
							}
						}
					break;
					case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
						if(BACK){ return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_MAGIC); }
						else{ Dr_Battle_NextToFriend(BUTTON,MENU,		
							,Main._player_choice_magic,Main._player_choice_enemy,,,Char_GetMagicTp(1,Main._player_friend_num-1,Main._player_choice_magic))}
					break;
					case DR_BATTLE_PLAYERMENU.CHOICE_FRIEND:
						if(BACK){ return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_MAGIC); }
						else{ Dr_Battle_NextToFriend(BUTTON,MENU,
							,Main._player_choice_magic,,Main._player_choice_friend,,Char_GetMagicTp(1,Main._player_friend_num-1,Main._player_choice_magic))
						}
					break;
					default:
						return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_MAGIC);
					break;
				}
			}
			else{
				//行动
				switch(MENU){
					case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
						if(BACK){ return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON); }
						else{ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_CLASS); }
					break;
					case DR_BATTLE_PLAYERMENU.CHOICE_CLASS:
						if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY); }
						else{ Dr_Battle_NextToFriend(BUTTON,MENU,Main._player_choice_act,,Main._player_choice_enemy
							,,,Dr_Battle_GetEnemyActUseTp(Main._player_choice_enemy,Main._player_choice_act)); 
						}
							
					break;
					default:
						return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY);
					break;
				}
			}
		break;
		case 2://药物
			switch(MENU){
				case DR_BATTLE_PLAYERMENU.CHOICE_ITEM:
				
					if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON) }
					else{ 			
						var isUseToEnemy = Item_IsUseToEnemy(Item_Get(Main._player_choice_item));
						if(isUseToEnemy){
							Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY)
						}
						else{
							Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_FRIEND)
						}
					}
					
				break;
				
				case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:			
					if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ITEM) }
					else{ 						
						Dr_Battle_NextToFriend(BUTTON,MENU,,,Main._player_choice_enemy,,Main._player_choice_item);
					}
				break;
				
				case DR_BATTLE_PLAYERMENU.CHOICE_FRIEND:
					if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ITEM) }
					else{ 
						//通过添加已选择的物品来确定要隐藏的药品					
						var is_choice = 0;
						for (var i = 0; i < array_length(Main._player_item_is_use); ++i) {
						    if(Main._player_choice_item + is_choice >= Main._player_item_is_use[i]){
								is_choice +=1
							}
						}
						
						array_push(Main._player_item_is_use,Main._player_choice_item + is_choice);
						//show_message(Main._player_item_is_use)
						Dr_Battle_NextToFriend(BUTTON,MENU,,,,Main._player_choice_friend,Main._player_choice_item + is_choice);					
					}
				break;
				
				default:
					return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ITEM) 
				break;
			}
		break;
		case 3://仁慈
			switch(MENU){
				case DR_BATTLE_PLAYERMENU.CHOICE_ENEMY:
					if(BACK){ Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON) }
					else{ 						
						Dr_Battle_NextToFriend(BUTTON,MENU,,,Main._player_choice_enemy);
					}
				break;
				default:
					return Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.CHOICE_ENEMY) 
				break;
			}
		break;
		case 4://防御
			//Dr_Battle_AddTp(25)
			var tpNum = Dr_Battle_GetTp();
			var num = clamp(tpNum + 25,0,100);
			//show_message(num)
			Dr_Battle_NextToFriend(BUTTON,MENU,,,,,,-(num - tpNum));
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
			Dr_Battle_CallDialog(Dr_Battle_GetAllEnemyName(true),Main._dialogue_style,1,true);	
			Main._player_menu = MENU
			UI.text_choice_num = _player_choice_enemy;
			
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_CLASS){
			// ---------行动			
			var canUse = [];
			var enemy = Dr_Battle_GetEnemyActAll(Main._player_choice_enemy);
			for(var i = 0; i < array_length(enemy); i++){
				//var needTp = Char_GetMagicTp(1,_player_friend_num - 1,i);
				var needTp = Dr_Battle_GetEnemyActUseTp(Main._player_choice_enemy,i);
				if(needTp <= Dr_Battle_GetTp() or needTp <= 0 ){
					array_push(canUse,true);
				}
				else{
					array_push(canUse,false);
				}
			}
			
			Dr_Battle_CallDialog(Dr_Battle_GetEnemyActAllName(Main._player_choice_enemy),Main._dialogue_style,2,true,canUse);	
			Main._player_menu = MENU
			UI.text_choice_num = _player_choice_act;
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_MAGIC){
			var canUse = [];
			for(var i = 0; i < array_length(Char_GetMagic(1,Main._player_friend_num - 1)); i++){
				var needTp = Char_GetMagicTp(1,_player_friend_num - 1,i);
				if(needTp <= Dr_Battle_GetTp() or needTp <= 0 ){
					array_push(canUse,true);
				}
				else{
					array_push(canUse,false);
				}
			}
			var firendNum =Main._player_friend_num-1
			Dr_Battle_CallDialog(Char_GetMagicNameAll(1,firendNum),Main._dialogue_style,2,true,canUse);	
			Main._player_menu = MENU
			UI.text_choice_num = _player_choice_magic;
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_ITEM){
			var itmName = Item_GetNameAll();		
			function Filter_Name(ELM,IND){
				var Main = dr_battle_main._player_item_is_use;
				for(var i = 0; i < array_length(Main); i++){
					if(IND == Main[i]){
						return false
					}
				}
				return true;
			}		
			var allName = array_filter(itmName,Filter_Name);
			Dr_Battle_CallDialog(allName,Main._dialogue_style,2,true);	
			Main._player_menu = MENU
			UI.text_choice_num = _player_choice_item;
		}
		else if(MENU == DR_BATTLE_PLAYERMENU.CHOICE_FRIEND){
			Dr_Battle_CallDialog(Dr_Battle_GetFriendNameAll(),Main._dialogue_style,1,true);	
			Main._player_menu = MENU
			UI.text_choice_num = _player_choice_friend;
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
function Dr_Battle_SetTp(TP){
	live_ext;
	var Main = dr_battle_main
	Main._player_tp = TP;
	
	return true;
}