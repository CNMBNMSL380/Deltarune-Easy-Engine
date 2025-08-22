///@arg zone
///@arg kills
function Player_SetKillsRuins(){
	var ZONE=argument[0];
	var KILLS=argument[1];
	
	ks = Flag_Get(FLAG_STATIC,"kills");
	ks[0][ZONE] = KILLS;
	var result=Flag_Set(FLAG_STATIC,"kills",ks);

	return result;
}