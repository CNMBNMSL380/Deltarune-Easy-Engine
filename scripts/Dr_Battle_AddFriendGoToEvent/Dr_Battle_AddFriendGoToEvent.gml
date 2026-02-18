// Script assets have changed for v2.3.0 see
function Dr_Battle_AddFriendGoToEvent(SLOT,INST,MENU,BUTTON,CHOICE_ACT = -1,CHOICE_MAGIC = -1,CHOICE_ENEMY = -1,CHOICE_FRIEND = -1,CHOICE_ITEM = -1,NOT_CLEAR = false , USETP = 0){
	///@arg 索引
	///@arg 实例
	///@arg 设置
	///@arg 按钮
	///@arg ACT
	///@arg MAG
	///@arg EMY
	///@arg FRI
	///@arg ITM
	///@arg 无法清除
	///@arg 使用TP
	
	var Main = dr_battle_main
	var FriendStrc = {
		//储存编号
		friend_slot : SLOT,
		friend_ins : INST,
		friend_menu : MENU,
		friend_button : BUTTON,
		friend_choice_act : CHOICE_ACT,
		friend_choice_magic : CHOICE_MAGIC,
		friend_choice_item : CHOICE_ITEM,
		friend_choice_enemy : CHOICE_ENEMY,
		friend_choice_friend : CHOICE_FRIEND,
		friend_use_tp : USETP		
			
	}
	array_push(Main._player_GoToEvent,FriendStrc);
	return Main._player_GoToEvent[SLOT];
}