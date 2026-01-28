/// @description 开始战斗
live;
show_debug_message("--------------")
//Dr_Battle_PlayFriendAnimMode(_char_id,DR_PLAYER_INDEX.IDLE,true,-1);
Dr_Battle_SetFriendSpriteMode(_char_spr,DR_PLAYER_INDEX.IDLE);
//Dr_Battle_PlaySpriteAnimOnce(_char_spr,DR_PLAYER_INDEX.IDLE,25,true)
//var st = MyAlarm_Add(,function(){
//	MyAlarm_Destroy("friend_anim" + string(_char_id));
//	MyAlarm_Destroy("friend_anim_loop" + string(_char_id));
//},50)
//Dr_Battle_PlayFriendAnimMode(_char_id,DR_PLAYER_INDEX.INTRO,true,-1)

//show_message(_char_spr)