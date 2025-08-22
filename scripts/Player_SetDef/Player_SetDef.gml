///@arg def
function Player_SetDef() {
	var DEF=argument[0];

	var result=Flag_Set(FLAG_STATIC,"def",DEF);

	return result;


}
