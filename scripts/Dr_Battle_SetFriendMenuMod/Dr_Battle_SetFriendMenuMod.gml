// Script assets have changed for v2.3.0 see
function Dr_Battle_SetFriendMenuMod(SLOT,INST,MENU,BUTTON,
	CHOICE_ACT = -1,CHOICE_MAGIC = -1,CHOICE_ENEMY = -1,CHOICE_FRIEND = -1,CHOICE_ITEM = -1,NOT_CLEAR = false){
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
		
		//储存事件
		//act_begin_function : function(){},
		//act_run_function : function(){},
		//act_end_function : function(){},
	
		//magic_begin_function : function(){},
		//magic_run_function : function(){},
		//magic_end_function : function(){},
			
			
	}
	array_push(Main._player_GoToEvent,FriendStrc);
	show_debug_message(FriendStrc)
	return Main._player_GoToEvent[SLOT];
}