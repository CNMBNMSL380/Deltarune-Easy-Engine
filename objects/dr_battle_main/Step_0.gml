/// @description 事件
live;

input_con = Input_IsPressed(INPUT.CONFIRM);
input_can = Input_IsPressed(INPUT.CANCEL);
var UI = dr_battle_ui;
if(_stage == DR_BATTLE_STAGE.PLAYER){
	if(_player_menu == DR_BATTLE_PLAYERMENU.BUTTON){
		_player_button = switch_H(_player_button , -1 , 5 , 1);
		_player_friend_class[_player_friend_num].choice_button = _player_button;
		if(input_con){
			audio_play_sound(snd_menu_confirm,0,0);
			Dr_Battle_ChoicePlayerMenu(_player_button);			
		}
		if(input_can){
			if(_player_friend_num !=0 ){
				//清除上一个友军类的内容并返回上一个
				Dr_Battle_BackToFriend();
				audio_play_sound(snd_menu_confirm,0,0);
			}
		}
	}
	else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_ENEMY){
		//show_debug_message(1)
		_player_choice_enemy = switch_V(_player_choice_enemy , -1 , array_length(Dr_Battle_GetAllEnemyName()) ,1);
		 UI.choice_num = _player_choice_enemy;
		if(input_con){
			audio_play_sound(snd_menu_confirm,0,0);
			Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ENEMY);			
		}
		if(input_can){
			Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ENEMY,true);	
		
		}
	}
	else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_CLASS){
		_player_choice_class = switch_V(_player_choice_class , -1 , array_length(Dr_Battle_GetAllEnemyAct(_player_choice_enemy)) ,2);
		_player_choice_class = switch_H(_player_choice_class , -1 , array_length(Dr_Battle_GetAllEnemyAct(_player_choice_enemy)) ,1);
		 UI.choice_num = _player_choice_class;
		if(input_con){
			audio_play_sound(snd_menu_confirm,0,0);
			Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_CLASS);			
		}
		if(input_can){
			Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_CLASS,true);	
		
		}
	}	
	else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_ITEM){
		_player_choice_item = switch_V(_player_choice_item , -1 , Item_GetNumber() ,2);
		_player_choice_item = switch_H(_player_choice_item , -1 , Item_GetNumber() ,1);
		UI.choice_num = _player_choice_item;
		if(input_con){
			_player_menu = Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ITEM);
		}
		if(input_can){
			_player_menu = Dr_Battle_ChoicePlayerMenu(-1);
		
		}
	}
	if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_FRIEND){
		_player_choice_friend = switch_H(_player_choice_item , -1 , array_length(_player_friend) ,1);
		UI.choice_num = _player_choice_item;
		if(input_con){
			_player_menu = Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_FRIEND);
		}
		if(input_can){
			_player_menu = Dr_Battle_ChoicePlayerMenu(-1);
		
		}
	}
	else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_MAGIC){
		
		if(input_can){
			_player_menu = Dr_Battle_ChoicePlayerMenu(-1);
		
		}
	}
}
//非玩家回合
if(_stage != DR_BATTLE_STAGE.PLAYER){
	if(_stage == DR_BATTLE_STAGE.ACT){
		_stage_time -= _stage_timeSpeed;
		var UI = dr_battle_ui;
		if(_stage_time < 0){
			if(_player_act_num < array_length(_player_act_event)){		
				if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					Dr_Battle_NextEnemyAct()
					_player_act_num+=1
					Dr_Battle_SetStageTime()
				}
			}
			else{
				if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					Dr_Battle_SetStage(DR_BATTLE_STAGE.MERCY);
				}
			}		
		}
	}
	else if(_stage == DR_BATTLE_STAGE.MERCY){
		Dr_Battle_SetStage(DR_BATTLE_STAGE.ITEM);
	}
	else if(_stage == DR_BATTLE_STAGE.ITEM){
		Dr_Battle_SetStage(DR_BATTLE_STAGE.FIGHT);
	}
	else if(_stage == DR_BATTLE_STAGE.FIGHT){
		_stage_time -= _stage_timeSpeed;
		if(_stage_time < 0){		
			instance_destroy(dr_battle_menu_fight)
			Dr_Battle_SetStage(DR_BATTLE_STAGE.DIALOG);					
		}
		if(input_con){
			with(dr_battle_menu_fight){
				event_user(0)
			}
			dr_battle_main._player_fight_slot ++;
		}
	}
	else if(_stage == DR_BATTLE_STAGE.DIALOG){
		if!(instance_exists(dr_battle_turn)){
			Dr_Battle_SetStage(DR_BATTLE_STAGE.BEFORE_TURN);
		}
	}
	else if(_stage == DR_BATTLE_STAGE.BEFORE_TURN){
		if(instance_exists(dr_battle_turn)){
			Dr_Battle_CallTurnEvent(DR_TURN_EVENT.INIT);
			
			Dr_Battle_SetStage(DR_BATTLE_STAGE.DIALOG_TURN);
			
			
		}
		else{
			Dr_Battle_SetStage(DR_BATTLE_STAGE.RESET);
		}
		//Dr_Battle_SetStage(DR_BATTLE_STAGE.START_TURN);
	}
	else if(_stage == DR_BATTLE_STAGE.DIALOG_TURN){	
		if!(instance_exists(dr_battle_ui_dialogBox)){
			Dr_Battle_SetStage(DR_BATTLE_STAGE.START_TURN);
		}					
	}
	else if(_stage == DR_BATTLE_STAGE.START_TURN){
		var BTL_board = dr_battle_board;
		if!(BTL_board.in_anim){
			Dr_Battle_SetStage(DR_BATTLE_STAGE.IN_TRUN);
		}
	}
	else if(_stage == DR_BATTLE_STAGE.IN_TRUN){
		_stage_time -= _stage_timeSpeed;
		if(_stage_time < 0 ){
			Dr_Battle_SetStage(DR_BATTLE_STAGE.END_TURN);
		}
	}
	else if(_stage == DR_BATTLE_STAGE.END_TURN){
		Dr_Battle_SetStage(DR_BATTLE_STAGE.RESET);
	}
	else if(_stage == DR_BATTLE_STAGE.RESET){
		Dr_Battle_MainDataReset()
		Dr_Battle_SetStage(DR_BATTLE_STAGE.PLAYER);
	}
	else if(_stage == DR_BATTLE_STAGE.END_BATTLE){
		
	}
}
///如果敌人已经清空或者接受了游戏胜利型号==信号
if(_stage != DR_BATTLE_STAGE.START_BATTLE){
	if(game_win or array_length(_enemy) < 0){
		Dr_Battle_SetStage(DR_BATTLE_STAGE.END_BATTLE)
		game_win = false;
	}

}