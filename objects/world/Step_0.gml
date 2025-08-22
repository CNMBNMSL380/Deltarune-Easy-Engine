live;

Anim_Step();
BGM_Step();

if(_time>=60){
	Flag_Set(FLAG_STATIC,"time",Flag_Get(FLAG_STATIC,"time")+1);
	_time=0;
}else{
	_time+=1;
}

if(instance_exists(_CRT_ins)){
	if(_room !=room){
		resize()
		_room = room;
	}
}

if(Game_GetFrameSkip()>0){
	if(_frame_skip>=Game_GetFrameSkip()){
		draw_enable_drawevent(true);
		_frame_skip=0;
	}else{
		_frame_skip+=1;
		draw_enable_drawevent(false);
	}
}else{
	draw_enable_drawevent(true);
}

if(keyboard_check_pressed(vk_f2)){
	game_restart();
	resize()
}

if(keyboard_check_pressed(ord("1"))){
	if(instance_exists(_CRT_ins)){
		instance_destroy(_CRT_ins)
	}
	else{
		instance_create_depth(0,0,0,_CRT_ins)
		resize();
	}
}

//if(keyboard_check_pressed(192)){
//	Console_SetVisible(!Console_IsVisible());
//}

//Console_SetStatusText(0,"FPS: "+string(fps));
//Console_SetStatusText(1,"Room: "+string(room)+"("+room_get_name(room)+")");
//Console_SetStatusText(2,"InstC: "+string(instance_count));

//Console_Step();

if(keyboard_check_pressed(vk_f4)&&!keyboard_check(vk_alt)&&!keyboard_check(vk_control)&&!keyboard_check(vk_shift)){
	window_center()
	window_set_fullscreen(!window_get_fullscreen());
	//display_set_gui_maximize();
}

if(keyboard_check_pressed(vk_f3)){
	if(game_get_speed(gamespeed_fps) = 60){
		game_set_speed(10,gamespeed_fps);
	}
	else if(game_get_speed(gamespeed_fps) = 10){
		game_set_speed(3,gamespeed_fps);
	}
	else if(game_get_speed(gamespeed_fps) = 3){
		game_set_speed(60,gamespeed_fps);
	}
}