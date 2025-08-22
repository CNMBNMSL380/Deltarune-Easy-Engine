///@arg spd_item
function Player_SetSpdItem() {
	var SPD=argument[0];

	var result=Flag_Set(FLAG_STATIC,"spd_item",SPD);

	return result;


}
