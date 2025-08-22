// Script assets have changed for v2.3.0 see
function Resolution_Set(INDEX,BORDER){
	live;
	switch(INDEX){
		case 0:
			Window_SetSize(640,480);
			Camera_SetSize(640,480)
			border._enabled = BORDER;
			show_debug_message("窗口1")
			
		break;
		case 1:
			Window_SetSize(1280,960);
			Camera_SetSize(1280,960)
			border._enabled = BORDER;
			show_debug_message("窗口2")
			
		break;
		case 2:
			Window_SetSize(960,540);
			Camera_SetSize(640,480)
			border._enabled = BORDER;
			show_debug_message("窗口3")
			
		break;
		case 3:
			Window_SetSize(1980,1080);
			Camera_SetSize(640,480)
			border._enabled = BORDER;
			show_debug_message("窗口4")
			
		break;
		default:
			Window_SetSize(640,480);
			border._enabled = false;
			
			show_debug_message("窗口切换失败")
		break;
		world.resize();
		
		
		return true;
	}
}