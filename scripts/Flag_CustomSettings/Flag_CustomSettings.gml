function Flag_CustomSettings(){
	with(Flag_GetStorage(FLAG_SETTINGS)){
		Set("language",0);	//------	语言选择
		
		Set("Full_Screen",false);	//------	全屏
		Set("Resolution",0);	//------	分辨率- 0为640 % 480 - 2为960 % 540 - 1为 1280 % 960 - 3为1980 % 1080 
		Set("Resolution_set",[[640,480],[960,540],[1280,960],[1980,1080]]);	//------	分辨率变量，用于调用
		Set("Volume",50);	//------	音量
		Set("SFX",50);	//------	音效
		Set("Enable_CRT",false);	//------	是否启动CRT
		
	}
}