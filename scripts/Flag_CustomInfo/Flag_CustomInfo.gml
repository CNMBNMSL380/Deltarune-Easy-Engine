function Flag_CustomInfo(){
	with(Flag_GetStorage(FLAG_INFO)){
		Set("name",Player_GetName());
		Set("lv",Player_GetLv());
		Set("time",Flag_Get(FLAG_STATIC,"time"));
		Set("room",Flag_Get(FLAG_STATIC,"room"));
	}
}