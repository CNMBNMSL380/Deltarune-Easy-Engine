_time=0;
_frame_skip=0;

global.Panel = battle_menu_fight_knife;

_room = room;
_CRT_ins = crt_preset_NES

_char_ow_enemy= [];


function resize(){
	if(instance_exists(_CRT_ins)){
		_CRT_ins.resize_surfaces();
		_CRT_ins.output_width=camera.width;
		_CRT_ins.output_height=camera.height;
	}
}

//game_set_speed(30,gamespeed_fps)