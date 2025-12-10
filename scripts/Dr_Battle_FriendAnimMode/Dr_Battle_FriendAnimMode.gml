// Script assets have changed for v2.3.0 see
function Dr_Battle_FriendAnimMode(SLOT,MODE,IS_PLAY,LOOP = 0){
	live_ext
	var Main = dr_battle_main;
	slot = SLOT;
	inst = Main._player_friend[SLOT];
	mode = MODE;
	loop = LOOP;
	if(IS_PLAY){
		inst._char_mode = MODE;	
		index = sprite_get_number(inst._char_img[MODE]);
		indSpd = sprite_get_speed(inst._char_img[MODE]);
		var fixedSpeed = 15 * (indSpd / 15);
		var game_fps = room_speed;

		// 计算完整播放一次动画所需的总帧数
		totalframes = floor((index * game_fps) / fixedSpeed);
		
		//var fx = function(){
		//	inst._char_index[mode] = 0
		//	Anim_Create(inst._char_index,mode,0,0,0,index-0.9,totalframes);
		//}
		//MyAlarm_Destroy("friend_anim" + string(SLOT));
		//if(LOOP != 0){
		//	Anim_Destroy(inst._char_index);
		//	MyAlarm_Destroy("friend_anim" + string(SLOT))
		//	Anim_Create(inst._char_index,mode,0,0,0,index-1,totalframes);
		//    MyAlarm_Add("friend_anim" + string(SLOT), fx, totalframes ,,LOOP,true);
		//    //MyAlarm_Add("friend_anim_loop" + string(SLOT), fx, totalframes,, LOOP, false);
		//}		
		//else if (LOOP = -1){
		//	Anim_Destroy(inst._char_index);
		//	MyAlarm_Destroy("friend_anim" + string(SLOT))
		//	Anim_Create(inst._char_index,mode,0,0,0,index-1,totalframes);
		//    MyAlarm_Add("friend_anim" + string(SLOT), fx, totalframes ,,-1,true);
		//}
		//else{
		//	MyAlarm_Destroy("friend_anim" + string(SLOT))
		//	Anim_Create(inst._char_index,mode,0,0,0,index-1,totalframes);
		//}
		Anim_Create(inst._char_index,mode,0,0,0,index-1,totalframes);
	}
	else{
		inst._char_mode = MODE;	
	}
}