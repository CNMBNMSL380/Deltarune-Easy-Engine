///@arg exp
function Player_SetExp() {
	var EXP=argument[0];

	var result=Flag_Set(FLAG_STATIC,"exp",EXP);

	return result;


}
