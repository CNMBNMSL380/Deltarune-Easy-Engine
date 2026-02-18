/// @description 事件
live;

// 贴图动画进步器启动
Dr_Battle_SpriteAnimStep();
// 检查玩家输入（确认/取消）
input_con = Input_IsPressed(INPUT.CONFIRM);
input_can = Input_IsPressed(INPUT.CANCEL);
var UI = dr_battle_ui;
// 玩家回合主流程
if(_stage == DR_BATTLE_STAGE.PLAYER){
    if(_player_menu == DR_BATTLE_PLAYERMENU.BUTTON){
        _player_button = switch_H(_player_button , -1 , 5 , 1);
        _player_friend_class[_player_friend_num].choice_button = _player_button;
        if(input_con){
            audio_play_sound(snd_menu_confirm,0,0);
            // 当玩家在主菜单界面按下确认键时，调用Dr_Battle_ChoicePlayerMenu(_player_button)
            // 该函数根据当前按钮（攻击/行动/道具/仁慈/防御）决定后续菜单流程：
            // - 攻击：进入选择敌人界面
            // - 行动：判断是否有魔法，有则进入魔法菜单，否则进入行动类别选择
            // - 道具：进入道具选择界面
            // - 仁慈：进入选择敌人界面
            // - 防御：直接执行防御操作
            // 该函数会自动根据按钮类型切换菜单状态和界面显示
            Dr_Battle_ChoicePlayerMenu(_player_button);		
			Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.MENU_CHOICE_SWITCH);
        }
        if(input_can){
            if(_player_friend_num !=0 ){
                //清除上一个队友类的内容并返回上一个
                Dr_Battle_BackToFriend();
                audio_play_sound(snd_menu_confirm,0,0);
            }
        }
    }
	else if(_player_menu != DR_BATTLE_PLAYERMENU.BUTTON){
	    // 敌人选择界面
	    if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_ENEMY){
	        // 上下切换敌人
	        _player_choice_enemy = switch_V(_player_choice_enemy , -1 , array_length(Dr_Battle_GetAllEnemyName()) ,1);
	        UI.text_choice_num = _player_choice_enemy;
	        if(input_con){
	            audio_play_sound(snd_menu_confirm,0,0);
	            // 确认选择敌人，进入下一步菜单
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ENEMY);		
			
				Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.MENU_CHOICE_SWITCH);
	        }
	        if(input_can){
	            // 取消选择，返回上一级菜单
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ENEMY,true);	
	        }
	    }
	    // 行动类别选择界面
	    else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_CLASS){
	        // 上下左右切换行动类别
	        _player_choice_act = switch_V(_player_choice_act , -1 , array_length(Dr_Battle_GetEnemyActAll(_player_choice_enemy)) ,2);
	        _player_choice_act = switch_H(_player_choice_act , -1 , array_length(Dr_Battle_GetEnemyActAll(_player_choice_enemy)) ,1);
	        UI.text_choice_num = _player_choice_act;
	        if(input_con){
				var needTp = Dr_Battle_GetEnemyActUseTp(_player_choice_enemy,_player_choice_act);
				if(needTp <= Dr_Battle_GetTp() or needTp <= 0){
		            audio_play_sound(snd_menu_confirm,0,0);
		            // 确认选择行动类别
		            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_CLASS);	
					Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.MENU_CHOICE_SWITCH);
				}
	        }
	        if(input_can){
	            // 取消选择，返回上一级菜单
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_CLASS,true);	
	        }
	    }	
	    // 道具选择界面
	    else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_ITEM){
	        // 上下左右切换道具
	        _player_choice_item = switch_V(_player_choice_item , -1 , Item_GetNumber() - array_length(_player_item_is_use) ,2,,true);
	        _player_choice_item = switch_H(_player_choice_item , -1 , Item_GetNumber() - array_length(_player_item_is_use) ,1,,true);
	        UI.text_choice_num = _player_choice_item;
			//show_message(floor(20 / 6))
		
	        if(input_con){
	            audio_play_sound(snd_menu_confirm,0,0);
	            // 确认选择道具
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ITEM);
				Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.MENU_CHOICE_SWITCH);
	        }
	        if(input_can){
	            // 取消选择，返回上一级菜单
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_ITEM,true);	
	        }
	    }
	    // 选择友军界面（如道具使用对象）
	    else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_FRIEND){
	        // 左右切换友军
	        _player_choice_friend = switch_V(_player_choice_friend , -1 , array_length(_player_friend) ,1);
	        UI.text_choice_num = _player_choice_friend;
	        if(input_con){
				audio_play_sound(snd_menu_confirm,0,0);
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_FRIEND);
				Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.MENU_CHOICE_SWITCH);
	        }
	        if(input_can){
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_FRIEND,true);
        
	        }
	    }
	    // 魔法选择界面
	    else if(_player_menu == DR_BATTLE_PLAYERMENU.CHOICE_MAGIC){
	        _player_choice_magic = switch_H(_player_choice_magic , -1 , array_length(Char_GetMagic(1,_player_friend_num-1)) ,1);
	        _player_choice_magic = switch_V(_player_choice_magic , -1 , array_length(Char_GetMagic(1,_player_friend_num-1)) ,2);
	        UI.text_choice_num = _player_choice_magic;
	        if(input_con){
				var needTp = Char_GetMagicTp(1,_player_friend_num - 1,_player_choice_magic);
				if(needTp <= Dr_Battle_GetTp() or needTp <= 0){
					audio_play_sound(snd_menu_confirm,0,0);
		            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_MAGIC);
					Dr_Battle_EnemyFunc(,DR_BATTLE_ENEMY.MENU_CHOICE_SWITCH);
				}
	        }
	        if(input_can){
	            Dr_Battle_ChoicePlayerMenu(_player_button,DR_BATTLE_PLAYERMENU.CHOICE_MAGIC,true);	
	        }
	    }
	}
}

// 非玩家回合流程（敌人行动、回合切换等）
if(_stage != DR_BATTLE_STAGE.PLAYER){
    if(_stage == DR_BATTLE_STAGE.ACT){
        // 行动阶段倒计时
        _stage_time -= _stage_timeSpeed;
        var UI = dr_battle_ui;
        if(_stage_time < 0){
            if(_player_act_slot < array_length(_player_act_event)){		
                // 依次执行玩家行动事件
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
                    Dr_Battle_NextEnemyAct()
                    _player_act_slot+=1
                    Dr_Battle_SetStageTime()
                }
            }
            else{
                // 行动结束，进入魔法阶段
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					show_debug_message("准备跳转魔法")
                    Dr_Battle_SetStage(DR_BATTLE_STAGE.MAGIC);
                }
            }		
        }
    }
	else if(_stage == DR_BATTLE_STAGE.MAGIC){
		// 魔法阶段倒计时
        _stage_time -= _stage_timeSpeed;
        var UI = dr_battle_ui;		
		 if(_stage_time < 0){
            if(_player_magic_slot < array_length(_player_magic_event)){		
                // 依次执行玩家行动事件
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
                    //Dr_Battle_NextEnemyAct()
					var magEvent = _player_magic_event[_player_magic_slot]	
				
					Char_UseMagic(1,magEvent.slot-1,magEvent.magic,[magEvent.choice[0],magEvent.choice[1]],magEvent.char_name);
                    _player_magic_slot += 1;
                    Dr_Battle_SetStageTime()
                }
            }
            else{
                // 行动结束，进入魔法阶段
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					show_debug_message("准备跳转物品")
                    Dr_Battle_SetStage(DR_BATTLE_STAGE.MERCY);
                }
            }		
        }
	}
    else if(_stage == DR_BATTLE_STAGE.MERCY){
        // 仁慈阶段，自动进入道具阶段
		if(_stage_time < 0){
            if(_player_mercy_slot < array_length(_player_mercy_event)){		
                // 依次执行玩家行动事件
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					var mcyEvent = _player_mercy_event[_player_mercy_slot];
					Dr_Battle_PlaySpriteAnimOnce(_player_friend[mcyEvent.friend],DR_PLAYER_INDEX.MERCY);
					var ins =  Dr_Battle_GetEnemyInstance(mcyEvent.enemy)
					var val= Dr_Battle_SpareEnemy(ins);
					var name = Dr_Battle_GetEnemyName(mcyEvent.enemy);
					Dr_Battle_CallDialog("饶恕了" + name+ (val ? "" : "&{sleep 30}但他的名字不是黄色的") , ,3);
					//char_name饶恕了enemy_name
					//但他的名字还不是黄色的
					
					_player_mercy_slot+=1
                }
            }
            else{
                // 行动结束，进入魔法阶段
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
                     Dr_Battle_SetStage(DR_BATTLE_STAGE.ITEM);
                }
            }		
        }		
    }
    else if(_stage == DR_BATTLE_STAGE.ITEM){
        // 道具阶段（未完善）
        _stage_time -= _stage_timeSpeed;
        var UI = dr_battle_ui;		
		if(_stage_time < 0){
            if(_player_item_slot < array_length(_player_item_event)){		
                // 依次执行玩家行动事件
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					var itemEvent = _player_item_event[_player_item_slot];
					Dr_Battle_PlaySpriteAnimOnce(_player_friend[itemEvent.choice[1]],DR_PLAYER_INDEX.ITEM);
					Item_CallEvent(itemEvent._item,ITEM_EVENT.USE);
					_player_item_slot += 1;
					Dr_Battle_SetStageTime();
                }
            }
            else{
                // 行动结束，进入魔法阶段
                if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
					//清除药品
					for(var i = array_length(_player_item_event) -1; i > -1; i--){
						var itemEvent = _player_item_event[i];
						Item_Remove(itemEvent._item_slot);
					}
					
                    Dr_Battle_SetStage(DR_BATTLE_STAGE.FIGHT);
                }
            }		
        }		
    }
    else if(_stage == DR_BATTLE_STAGE.FIGHT){
        // 战斗阶段倒计时
        _stage_time -= _stage_timeSpeed;
        if(_stage_time < 0){		
            // 战斗结束，销毁战斗菜单，进入对话阶段
            instance_destroy(dr_battle_menu_fight)
            Dr_Battle_SetStage(DR_BATTLE_STAGE.DIALOG);					
        }
        if(input_con){
            // 玩家主动触发攻击
			if(_fight_menu_slot < array_length(_fight_menu_inst)){
				for(var j = 0; j < array_length(_fight_menu_inst[_fight_menu_slot]); j++){	
				    with(_fight_menu_inst[_fight_menu_slot][j]){
				        event_user(0)
				    }
					if(_fight_menu_slot == array_length(_fight_menu_inst)-1 ){
						Dr_Battle_SetStageTime(75);
					}
				}
	            dr_battle_main._fight_menu_slot ++;
			}
        }
    }
	// ----------------  进入敌人战斗回合
	
	
    else if(_stage == DR_BATTLE_STAGE.DIALOG){
        // 对话阶段，等待回合对象生成
		var UI = dr_battle_ui;
		if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
	        if!(instance_exists(dr_battle_turn)){
	            Dr_Battle_SetStage(DR_BATTLE_STAGE.BEFORE_TURN);
	        }
		}
    }
    else if(_stage == DR_BATTLE_STAGE.BEFORE_TURN){
        // 回合开始前，初始化回合事件
        if(instance_exists(dr_battle_turn)){
            Dr_Battle_CallTurnEvent(DR_TURN_EVENT.INIT);
            Dr_Battle_SetStage(DR_BATTLE_STAGE.DIALOG_TURN);
        }
        else{
            // 没有回合对象则重置
            Dr_Battle_SetStage(DR_BATTLE_STAGE.RESET);
        }
        //Dr_Battle_SetStage(DR_BATTLE_STAGE.START_TURN);
    }
    else if(_stage == DR_BATTLE_STAGE.DIALOG_TURN){	
        // 回合对话阶段，等待对话框关闭
        if!(instance_exists(dr_battle_ui_dialogBox)){
            Dr_Battle_SetStage(DR_BATTLE_STAGE.START_TURN);
        }					
    }
    else if(_stage == DR_BATTLE_STAGE.START_TURN){
        // 回合开始动画
        var BTL_board = dr_battle_board;
        if!(BTL_board.in_anim){
            Dr_Battle_SetStage(DR_BATTLE_STAGE.IN_TRUN);
        }
		
    }
    else if(_stage == DR_BATTLE_STAGE.IN_TRUN){
        // 回合进行中，倒计时
        _stage_time -= _stage_timeSpeed;
        if(_stage_time < 0 ){
            Dr_Battle_SetStage(DR_BATTLE_STAGE.END_TURN);
        }
    }
    else if(_stage == DR_BATTLE_STAGE.END_TURN){
        // 回合结束，重置
        Dr_Battle_SetStage(DR_BATTLE_STAGE.RESET);
    }
    else if(_stage == DR_BATTLE_STAGE.RESET){
        // 重置数据，回到玩家回合
        Dr_Battle_MainDataReset()
        Dr_Battle_SetStage(DR_BATTLE_STAGE.PLAYER);
    }
    else if(_stage == DR_BATTLE_STAGE.END_BATTLE){
        // 战斗胜利，等待文本播放完毕后进入黑屏
	    var UI = dr_battle_ui;
		if(array_length(UI.text_inst) == 0 or !instance_exists(UI.text_inst[0])){
			Dr_Battle_SetStage(DR_BATTLE_STAGE.BLACK);
		}
	}
}


// 检查是否胜利（敌人全部消灭或收到胜利信号）
if(_stage != DR_BATTLE_STAGE.START_BATTLE and 
_stage !=DR_BATTLE_STAGE.END_BATTLE and 
_stage != DR_BATTLE_STAGE.BLACK and
_stage != DR_BATTLE_STAGE.FIGHT

){
    if(game_win = 1 or array_length(_enemy) = 0){
        Dr_Battle_SetStage(DR_BATTLE_STAGE.END_BATTLE);		
        game_win = 2;
    }
}
if(_stage != DR_BATTLE_STAGE.START_BATTLE){
	if(Char_IsLoser()){
		var soul_x = _player_soul_inst.x;
		var soul_y = _player_soul_inst.y;
		Flag_Set(FLAG_TEMP,"GAMEOVER_SOUL_X",soul_x);
		Flag_Set(FLAG_TEMP,"GAMEOVER_SOUL_Y",soul_x);
		room_goto(room_gameover);
	}
}
