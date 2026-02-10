// Script assets have changed for v2.3.0 see
function Dr_Battle_NextToFriend(BUTTON, MENU, ACT = -1, MAGIC = -1, ENEMY = -1, FRIEND = -1, ITEM = -1 , USETP = 0){
    var Main = dr_battle_main;
    var UI = dr_battle_ui;

    var friendMain = Main._player_friend;
    var friendClass = Main._player_friend_class;
    var friendNum = Main._player_friend_num;

	//改变UI状态
	friendClass[friendNum].animSwitch();
	friendClass[friendNum]._header_ico_index = BUTTON + 1;
	//设置事件并发布
	var event_len = array_length(Main._player_GoToEvent);
	Dr_Battle_SetFriendMenuMod(event_len, Main._player_friend[Main._player_friend_num], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false , USETP);		
	//增值
	Main._player_friend_num ++;
	//检查下一个队友是否处于可操控状态
	for(; Main._player_friend_num < array_length(friendMain) ; Main._player_friend_num++ ){
		if(friendMain[Main._player_friend_num].is_controlled and Char_GetTeamHp(Main._player_friend_num) > 0){
			//重置数据并返回选择按钮界面
			Dr_Battle_MainClearClassData();
			Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
			//动画伸缩
			friendClass[Main._player_friend_num].animSwitch();
			//结束方法
			return true;
		}
	}
	//如果没有可循环内容，则结束设置
	Dr_Battle_MainPlayerMenuEnd();
	
	return true;
	
	
	
    //if ((friendNum + 1) < array_length(friendMain)) {
	//	//设置准备在下一个阶段要准备的回合
    //    Dr_Battle_SetFriendMenuMod(friendNum, Main._player_friend[friendNum], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false , USETP);		
	//			
	//	//当前的队友选择界面收缩
    //    friendClass[friendNum].animSwitch();
	//	//选择界面的ICO切换到指定设置贴图
	//	//friendClass[friendNum]._header_ico_index = BUTTON + 1;
	//	friendClass[friendNum]._header_ico_index = Main._player_friend[friendNum]._char_ico_index[BUTTON + 1];
	//	//下一个队友选择界面张开
    //    friendClass[friendNum + 1].animSwitch();
        
    //    Main._player_friend_num++;

	//	Dr_Battle_MainClearClassData()
    //    Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
    //    return true;
    //} else {
    //    friendClass[friendNum].animSwitch();
    //    friendClass[friendNum]._header_ico_index = Main._player_friend[friendNum]._char_ico_index[BUTTON + 1];
	//	if(USETP != 0){
	//		Dr_Battle_AddTp(-USETP);
			
	//	}	
    //    Dr_Battle_SetFriendMenuMod(friendNum , Main._player_friend[friendNum ], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false , USETP);
    //    
    //    return true;
    //}
}
