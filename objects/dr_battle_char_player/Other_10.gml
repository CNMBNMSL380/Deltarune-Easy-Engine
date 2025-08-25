/// @description 初始化玩家 
live;
var st = MyAlarm_Add(,function(){
	_char_mode = DR_PLAYER_INDEX.INTRO
	var index = sprite_get_number(_char_img[DR_PLAYER_INDEX.INTRO]);
	var indSpd = sprite_get_speed(_char_img[DR_PLAYER_INDEX.INTRO])
	Anim_Create(_char_index,_char_mode,0,0,0,index-1,indSpd)
},25)
MyAlarm_Start(st)