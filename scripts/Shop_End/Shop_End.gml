function Shop_End(){
	var room_return=Flag_Get(FLAG_TEMP,"shop_room_return");
	if(room_exists(room_return)){
		fader.color=c_black;
		Fader_Fade(0,1,20);
		BGM_SetVolume(4,0,20);
		BGM_SetVolume(0,1,20,20);
	}
}