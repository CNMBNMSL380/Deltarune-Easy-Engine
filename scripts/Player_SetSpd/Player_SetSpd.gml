///@arg spd
function Player_SetSpd() {
	var SPD=argument[0];

	var result=Flag_Set(FLAG_STATIC,"spd",SPD);

	return result;


}
