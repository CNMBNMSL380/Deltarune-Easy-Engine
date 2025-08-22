///@arg kills
function Player_SetKills() {
	var KILLS=argument[0];

	var result=Flag_Set(FLAG_STATIC,"kills",KILLS);

	return result;
}
