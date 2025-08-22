///@arg hp_max
function Player_SetHpMax() {
	var HP_MAX=argument[0];

	var result=Flag_Set(FLAG_STATIC,"hp_max",HP_MAX);

	return result;


}
