// Script assets have changed for v2.3.0 see
function Dr_Battle_NextToFriend(BUTTON, MENU, ACT = -1, MAGIC = -1, ENEMY = -1, FRIEND = -1, ITEM = -1 , USETP = 0){
    var Main = dr_battle_main;
    var UI = dr_battle_ui;

    var friendMain = Main._player_friend;
    var friendClass = Main._player_friend_class;
    var friendNum = Main._player_friend_num;

    if ((friendNum + 1) < array_length(friendMain)) {
		//设置准备在下一个阶段要准备的回合
        Dr_Battle_SetFriendMenuMod(friendNum, Main._player_friend[friendNum], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false , USETP);		
		if(USETP != 0){
			Dr_Battle_AddTp(-USETP);
			
		}		
		//当前的队友选择界面收缩
        friendClass[friendNum].animSwitch();
		//选择界面的ICO切换到指定设置贴图
		//friendClass[friendNum]._header_ico_index = BUTTON + 1;
		friendClass[friendNum]._header_ico_index = Main._player_friend[friendNum]._char_ico_index[BUTTON + 1];
		//下一个队友选择界面张开
        friendClass[friendNum + 1].animSwitch();
        
        Main._player_friend_num++;

		Dr_Battle_MainClearClassData()
        Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
        return true;
    } else {
        friendClass[friendNum].animSwitch();
        friendClass[friendNum]._header_ico_index = Main._player_friend[friendNum]._char_ico_index[BUTTON + 1];
		if(USETP != 0){
			Dr_Battle_AddTp(-USETP);
			
		}	
        Dr_Battle_SetFriendMenuMod(friendNum , Main._player_friend[friendNum ], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false , USETP);
        Dr_Battle_MainPlayerMenuEnd();
        return true;
    }
}
