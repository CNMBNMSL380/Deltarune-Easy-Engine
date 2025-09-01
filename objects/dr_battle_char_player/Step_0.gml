/// @description 事件
live;
if(_char_mode == DR_PLAYER_INDEX.GLIDE){
	if(_char_glide_anim_mod == 1){
		_char_index[DR_PLAYER_INDEX.GLIDE] +=0.1;
	}
}
if(_char_mode == DR_PLAYER_INDEX.INTRO){
		
}
if(_char_mode == DR_PLAYER_INDEX.IDLE){
	_char_index[_char_mode] +=0.1;
}