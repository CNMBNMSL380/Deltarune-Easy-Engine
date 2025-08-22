// Script assets have changed for v2.3.0 see
function Dr_Battle_NextToFriend(BUTTON, MENU, ACT = -1, MAGIC = -1, ENEMY = -1, FRIEND = -1, ITEM = -1){
    var Main = dr_battle_main;
    var UI = dr_battle_ui;

    var friendMain = Main._player_friend;
    var friendClass = Main._player_friend_class;
    var friendNum = Main._player_friend_num;

    if ((friendNum + 1) < array_length(friendMain)) {
        Dr_Battle_SetFriendMenuMod(friendNum, Main._player_friend[friendNum], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false);

        friendClass[friendNum].animSwitch();
		friendClass[friendNum]._header_ico_index = BUTTON + 1;
		
        friendClass[friendNum + 1].animSwitch();
        
        Main._player_friend_num++;

        var uiClass = Main._player_friend_class[friendNum];
        uiClass._header_ico_index = BUTTON + 1;

        Dr_Battle_SetPlayerMenu(DR_BATTLE_PLAYERMENU.BUTTON);
        return true;
    } else {
        friendClass[friendNum].animSwitch();
        friendClass[friendNum]._header_ico_index = BUTTON + 1;

        Dr_Battle_SetFriendMenuMod(friendNum , Main._player_friend[friendNum ], MENU, BUTTON, ACT, MAGIC, ENEMY, FRIEND, ITEM, false);
        Dr_Battle_MainPlayerMenuEnd();
        return true;
    }
}
