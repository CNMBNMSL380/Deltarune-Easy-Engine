// Script assets have changed for v2.3.0 see
function Window_SetSize(WIDTH,HEIGHT){
	live;
	window_set_size(WIDTH,HEIGHT);
	window_center();
	
	return true;
}
function Camera_SetSize(WIDTH,HEIGHT){
	live;
	camera.width = WIDTH;
	camera.height = HEIGHT;
	
	return true;
}