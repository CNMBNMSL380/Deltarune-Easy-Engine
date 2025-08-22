///@arg lv
function Player_SetLv() {
	var LV=argument[0];

	var result=Flag_Set(FLAG_STATIC,"lv",LV);

	return result;


}
