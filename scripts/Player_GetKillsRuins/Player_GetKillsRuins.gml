///@arg zone*
function Player_GetKillsRuins(){
	var ZONE = -1;
	if(argument_count >= 1){
		ZONE = argument[0];
		return Flag_Get(FLAG_STATIC,"kills",[[0]])[0][ZONE];
	}
	else{
		return array_sum(Flag_Get(FLAG_STATIC,"kills",[[0]])[0]);
	}
}