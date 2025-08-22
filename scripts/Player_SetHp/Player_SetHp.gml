///@arg hp
function Player_SetHp() {
	var HP=argument[0];

	var result=Flag_Set(FLAG_STATIC,"hp",HP);

	return result;


}
